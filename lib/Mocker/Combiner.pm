use strict;
use warnings;

package Mocker::Combiner;
# ABSTRACT: combine individual variables into a row

use Text::CSV;

=head2 new 

Create a new instance of the class.

=cut

sub new {
    my $class     = shift;
    my $rh_params = shift;
    return Text::CSV->new( );
}

1;