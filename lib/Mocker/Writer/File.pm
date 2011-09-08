use strict;
use warnings;

package Mocker::Writer::File;
# ABSTRACT: write things to a file

use Mocker::Combiner;

sub new {
    my $class     = shift;
    my $rh_params = shift;
    my $self      = { };
    $self->{combiner} = Mocker::Combiner->new();
    return bless $self, $class;
}

1;