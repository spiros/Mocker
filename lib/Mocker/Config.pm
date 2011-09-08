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

my $config =  {
    'gender'     => { class => 'Mocker::Data::Medical::Gender'    },
    'heart_rate' => { class => 'Mocker::Data::Medical::HeartRate' },
    'height'     => { class => 'Mocker::Data::Medical::Height'    },
    'weight'     => { class => 'Mocker::Data::Medical::Weight'    },
    'surname'    => { class => 'Mocker::Data::Person::Surname'    },
    'first_name_male'    => { class => 'Mocker::Data::Person::FirstNameMale'    },
    'first_name_female'  => { class => 'Mocker::Data::Person::FirstNameFemale'  },
};

sub new {
    my $class = shift;
    my $self  = { };
    return bless $self, $class;
}

sub get_class_for_variable {
    my $self = shift;
    my $variable = shift;
    
    if ( exists $config->{$variable} ) {
        return $config->{$variable}{'class'}; 
    } else {
        return undef;
    }
}

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