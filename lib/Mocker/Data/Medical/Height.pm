use strict;
use warnings;

package Mocker::Data::Medical::Height;
# ABSTRACT: Height measurements.

use Mouse;

extends 'Mocker::Data';

sub generate {
    return int( rand(195) + 57 );
}

1;