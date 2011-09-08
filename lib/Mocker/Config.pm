use strict;
use warnings;

package Mocker::Config;

my $config =  {
    'gender'     => { class => 'Mocker::Data::Medical::Gender'    },
    'heart_rate' => { class => 'Mocker::Data::Medical::HeartRate' },
    'height'     => { class => 'Mocker::Data::Medical::Height'    },
    'weight'     => { class => 'Mocker::Data::Medical::Weight'    },
    'surname'    => { class => 'Mocker::Data::Person::Surname'    },
};

sub new {
    my $class = shift;
    my $self  = { };
    return bless $self, $class;
}





1;