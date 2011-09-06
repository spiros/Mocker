use strict;
use warnings;

package Mocker::Data::Medical::Gender;
# ABSTRACT: Patient gender.

use Mouse;

extends 'Mocker::Data';

sub generate {
    my $ra_genders = [ 'male', 'female', 'indeterminate' ];
    return $ra_genders->[int(rand(3))];
}

1;