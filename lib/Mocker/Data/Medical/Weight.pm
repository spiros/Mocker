use strict;
use warnings;

package Mocker::Data::Medical::Weight;
# ABSTRACT: Weight measurements.

use Mouse;

extends 'Mocker::Data';

sub generate {
    return sprintf("%.3f",rand(490) + 10);
}

1;