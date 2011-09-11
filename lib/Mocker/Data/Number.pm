use strict;
use warnings;

package Mocker::Data::Number;

use base 'Mocker::Data';

=head2 generate

Generate a new value.

=cut

sub generate {
    my $self = shift;
    my $min  = $self->min();
    my $max  = $self->max();
    my $round  = $self->round();
    
    defined $round
        ? return int(rand($max-$min))
        : return rand($max-$min);
    
}

1;