use strict;
use warnings;

package Mocker::Data::Medical::Weight;
# ABSTRACT: Weight measurements.

use Mouse;

extends 'Mocker::Data';

=head2 generate

Generate a new value.

=cut

sub generate {
    return sprintf("%.3f",rand(490) + 10);
}

1;