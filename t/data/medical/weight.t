use strict;
use warnings;

use Test::More;

use_ok('Mocker::Data::Medical::Weight');

{
    my $Mocker = Mocker::Data::Medical::Weight->new();
    my $n = 0;
    while ( $n <= 1000 ){
        $Mocker->clear;
        my $value = $Mocker->value;
        ok( $value >= 10 && $value <= 500, "test value: $value" );
        $n++;
    }

}


done_testing();
