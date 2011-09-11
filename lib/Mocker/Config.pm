use strict;
use warnings;

package Mocker::Config;
# ABSTRACT: Data generator configuration.

require Mocker::Data::Medical::Gender;
require Mocker::Data::Medical::HeartRate;
require Mocker::Data::Medical::Height;
require Mocker::Data::Medical::Weight;
require Mocker::Data::Person::Surname;
require Mocker::Data::Person::FirstNameMale;
require Mocker::Data::Person::FirstNameFemale;
require Mocker::Data::Number;

my $config =  {
    'number'     => { class  => 'Mocker::Data::Number'            },
    'gender'     => { class => 'Mocker::Data::Medical::Gender'    },
    'heart_rate' => { class => 'Mocker::Data::Medical::HeartRate' },
    'height'     => { class => 'Mocker::Data::Medical::Height'    },
    'weight'     => { class => 'Mocker::Data::Medical::Weight'    },
    'surname'    => { class => 'Mocker::Data::Person::Surname'    },
    'first_name_male'    => { class => 'Mocker::Data::Person::FirstNameMale'    },
    'first_name_female'  => { class => 'Mocker::Data::Person::FirstNameFemale'  },
};

=head2 new 

Create a new instance of the class.

=cut

sub new {
    my $class = shift;
    my $self  = { };
    return bless $self, $class;
}

=head2 get_class_for_variable

Return the name of the data generating class for the given variable.
This method returns I<undef> on error.

=cut

sub get_class_for_variable {
    my $self = shift;
    my $variable = shift;
    
    if ( exists $config->{$variable} ) {
        return $config->{$variable}{'class'}; 
    } else {
        return undef;
    }
}

=head2 create_class_for_variable 

Return an instantiated data generating class for the given
variable. Will optionally take class options and pass them along.
This method returns I<undef> on error.

=cut

sub create_class_for_variable {
    my $self = shift;
    my $variable = shift;
    my $rh_class_options = shift;
    
    my $class = 
        $self->get_class_for_variable( $variable );

    my $object = $class->new( $rh_class_options );
    
    return $object;
}

1;