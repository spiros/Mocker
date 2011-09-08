use strict;
use warnings;

package Mocker::Data::Medical::Height;
# ABSTRACT: Height measurements.

use Mouse;

extends 'Mocker::Data';

=head2 generate

Generate a new value.

=cut

sub generate {
    return int( rand(195) + 57 );
}

1;