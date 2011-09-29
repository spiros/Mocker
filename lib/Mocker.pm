use strict;
use warnings;

package Mocker;
# ABSTRACT: Generate fake data.

use Mocker::Config;
use Carp;
use Data::Dumper;
use Mocker::Writer;

=head2 new

Create new instance of the Mocker class. The new() method takes one parameter, a
reference to hash with the configuration for the desired data. 

    my $rh_configuration = { 
    
        'variables' => {
        
            'gender' => {
                'order'    => 0,
                'nicename' => 'sex'
            },
        
            'surname' => {
                'order' => 1
            },
        
            'weight' => {
                'order' => 2
            },
        
            'number' => {
                'order' => 3,
                'min'   => 10,
                'max'   => 20,
                'round' => 1
            }
        
        },
    
        'rows' => 100,
    
        'output' => {
            'target'   => 'screen',
        }
    
    };


    my $Mocker = Mocker->new( $rh_configuration );

    $Mocker->generate;

=cut

=head2 Configuration

The following pre-defined canonical variable types are available:

L<Mocker::Data::Medical::Gender>
L<Mocker::Data::Medical::HeartRate>
L<Mocker::Data::Medical::Height>
L<Mocker::Data::Medical::Weight>
L<Mocker::Data::Number>
L<Mocker::Data::Person::Surname>
L<Mocker::Data::Person::FirstNameFemale>
L<Mocker::Data::Person::FirstNameMale>

The 'variables' key of the configuration hash contains the canonical column names 
along with some other per-variable configuration parameters. The I<order> contains the
column position which you want to the variable to be placed in the output. By default,
the variables canonical names will be used, this can be overwritten by using I<nicename>

  'gender' => {
        'order'    => 0,
        'nicename' => 'sex'
    },

For numerical variables you can additionally specify a minimum I<min>, a maximum I<max> 
and if you want to round the value.

    'number' => {
        'order' => 3,
        'min'   => 10,
        'max'   => 20,
        'round' => 1
    }

You can specify the number of rows you want using the 'rows' key.

    'rows' => 100,

The output information is specified in the 'output' key. To write to STDOUT set the I<target>
to I<screen> and to write to a file set the I<target> to I<file> and specify a filename using 
I<filename>.

    'output' => {
        'target'   => 'screen',
    }

    'output' => {
        'target'   => 'file',
        'filename' => 'testdata.csv'
    }

Existing files will not be overwritten and will cause a fatal error.

=cut
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

        $rh_options->{nicename} ||= $variable;
        my $class = Mocker::Config->get_class_for_variable( $variable );
        my $object = $class->new( $rh_options );
        
        $rh_config->{columns}->{ $rh_options->{'order'} } = $object;
    }
    
    return $rh_config;
}

=head2 generate

Generate the data and write to supplied output method.

    $Mocker->generate;

=cut

sub generate {
    my $self = shift;
    
    my $n=0;
    
    my $rh_config  = $self->{config};
    my $total_rows = $rh_config->{total_rows};
    my $rh_columns = $rh_config->{columns};
    
    my $Writer = $self->{writer};
    
    my $ra_headers = 
        $self->generate_headers( $rh_columns );
    
    $Writer->write_row( $ra_headers );
    
    while ( $n <= $total_rows ) {
        
        my $ra_row = $self->generate_row( $rh_columns );

        $Writer->write_row( $ra_row );
        $n++;
    }
    
    return 1;

}

sub generate_headers {
    my $self = shift;
    my $rh_columns = shift;
    
    my $ra_row = [ ];
    
    foreach my $index ( keys %$rh_columns ){
        my $Column = $rh_columns->{$index};
        my $nicename = $Column->nicename;
        push(@$ra_row, $nicename)
    }
    
    return $ra_row;
    
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
