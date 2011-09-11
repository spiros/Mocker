use strict;
use warnings;

package Mocker::Data::Number;

use base 'Mocker::Data';
use Carp;

=head2 generate

Generate a new value.

=cut

sub generate {
    my $self = shift;
    my $min  = $self->min();
    my $max  = $self->max();
    my $round  = $self->round();
    
    unless ( defined $min ) {
        $min = 0;
    }
    
    unless ( defined $max ) {
        croak "You nust specify a maximum range for the number type.";
    }
    
    defined $round
        ? return int(rand($max-$min))
        : return rand($max-$min);
    
}

1;