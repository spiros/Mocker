use strict;
use warnings;

use Test::More;

use_ok('Mocker::Writer::Screen');

my $ScreenWriter = Mocker::Writer::Screen->new();

isa_ok( $ScreenWriter, 'Mocker::Writer::Screen' );

done_testing();
