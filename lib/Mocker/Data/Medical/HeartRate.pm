use strict;
use warnings;

package Mocker::Data::Medical::HeartRate;
# ABSTRACT: Heart rate measurements in BPM.

use Mouse;

extends 'Mocker::Data';

=head2 generate

Generate a new value.

=cut

sub generate {
    return int( rand(191) + 30 );
}

1;