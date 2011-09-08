use strict;
use warnings;

package Mocker;
# ABSTRACT: Generate fake data.

use Mocker::Config;
use Carp;
use Data::Dumper;

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
    
    return $self;
}


sub parse_configuration {
    my $self = shift;
    my $rh   = shift;

    my $rh_config = { };
        
    my $rh_variables = $rh->{variables};
    
    my $total_rows = $rh->{rows};
    
    $rh_config->{total_rows} = $total_rows;

    foreach my $variable ( keys %$rh_variables ) {
        
        my $rh_options = $rh_variables->{$variable};
        my $class = Mocker::Config->get_class_for_variable( $variable );
        my $object = $class->new( $rh_options );
        
        $rh_config->{columns}->{ $rh_options->{'order'} } = $object;
    }
    
    return $rh_config;
}

1;
