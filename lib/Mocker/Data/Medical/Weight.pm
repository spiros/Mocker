use strict;
use warnings;

package Mocker::Data::Medical::Weight;
# ABSTRACT: Weight measurements.

use Mouse;

extends 'Mocker::Data';

sub generate {
    return int(rand(500)) + 0.001 ;
}

1;