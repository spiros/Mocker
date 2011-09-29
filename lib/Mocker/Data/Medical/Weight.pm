use strict;
use warnings;

package Mocker::Data::Medical::Weight;
# ABSTRACT: Weight measurements.

use Mouse;

extends 'Mocker::Data';

=head2 generate

Generate a new weight value between 10 and 500kg.

=cut

sub generate {
    return sprintf("%.3f",rand(490) + 10);
}

1;