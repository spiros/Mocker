use strict;
use warnings;

package Mocker::Writer::Screen;
# ABSTRACT: write things to STDOUT

use Mocker::Combiner;

=head2 new

Create a new instance of the class.
This method returns I<undef> on error.

=cut

sub new {
    my $class     = shift;
    my $rh_params = shift;
    my $self      = { };
    $self->{combiner} = Mocker::Combiner->new();
    return bless $self, $class;
}

sub write_row {
    my $self    = shift;
    my $ra_row  = shift;
    
    my $rv = 
        $self->{combiner}->combine( @$ra_row );
    
    if ( $rv ) {
        printf STDERR ("%s\n", $self->{combiner}->string );
    }
    
    else {
        return undef;
    }
}

1;