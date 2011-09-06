use strict;
use warnings;

package Mocker::Data::Medical::HeartRate;
# ABSTRACT: Heart rate measurements in BPM.

use Mouse;

extends 'Mocker::Data';

sub generate {
    return int( rand(191) + 30 );
}

1;