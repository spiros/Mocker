use strict;
use warnings;

package Mocker;
# ABSTRACT: Generate fake data.

use Mocker::Config;
use Carp;
use Data::Dumper;
use Mocker::Writer;

sub new {
    my $class     = shift;
    my $rh_config = shift;
    
    unless ( defined $rh_config ){
        croak "No configuration supplied."
    }
    my $self = { };
    bless $self, $class;
    
    $self->{config} = 
        $self->parse_configuration( $rh_config );

    $self->{writer} =
        Mocker::Writer->new( $self->{config}{output} );
    
    return $self;
}


sub parse_configuration {
    my $self = shift;
    my $rh   = shift;

    my $rh_config = { };
        
    my $rh_variables = $rh->{variables};
    
    my $total_rows = $rh->{rows};
    my $rh_output  = $rh->{output};
    
    $rh_config->{total_rows} = $total_rows;
    
    unless ( defined $total_rows && $total_rows ) {
        croak 'total_rows must be at least one';
    }
    
    $rh_config->{output}     = $rh_output;

    foreach my $variable ( keys %$rh_variables ) {
        
        my $rh_options = $rh_variables->{$variable};
        my $class = Mocker::Config->get_class_for_variable( $variable );
        my $object = $class->new( $rh_options );
        
        $rh_config->{columns}->{ $rh_options->{'order'} } = $object;
    }
    
    return $rh_config;
}

sub generate {
    my $self = shift;
    
    my $n=0;
    
    my $rh_config  = $self->{config};
    my $total_rows = $rh_config->{total_rows};
    my $rh_columns = $rh_config->{columns};
    
    my $Writer = $self->{writer};
    
    while ( $n <= $total_rows ) {
        
        my $ra_row = $self->generate_row( $rh_columns );

        $Writer->write_row( $ra_row );
        $n++;
    }
    
    return 1;

}

sub generate_row {
    my $self = shift;
    my $rh_columns = shift;
    
    my $ra_row = [ ];
    
    foreach my $index ( keys %$rh_columns ){
        my $Column = $rh_columns->{$index};
        $Column->clear();
        my $value = $Column->value;
        push(@$ra_row, $value)
    }
    
    return $ra_row;
}

1;
