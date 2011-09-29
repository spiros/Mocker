use strict;
use warnings;

package Mocker::Data::Medical::Gender;
# ABSTRACT: Patient gender.

use Mouse;

extends 'Mocker::Data';

=head2 generate

Generate a new value. Valid gender values are 'male', 'female' and
'indeterminate'.

=cut

sub generate {
    my $ra_genders = [ 'male', 'female', 'indeterminate' ];
    return $ra_genders->[int(rand(3))];
}

1;