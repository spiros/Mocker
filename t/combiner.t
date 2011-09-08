use strict;
use warnings;

use Test::More;

use_ok('Mocker::Combiner');

my $Combiner = Mocker::Combiner->new();

isa_ok($Combiner, 'Text::CSV');

done_testing();