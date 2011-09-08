use strict;
use warnings;

use Test::More;

use_ok('Mocker::Data::Medical::Height');

{
    my $Mocker = Mocker::Data::Medical::Height->new();
    my $n = 0;
    while ( $n <= 1000 ){
        $Mocker->clear;
        my $value = $Mocker->value;
        ok( $value >= 57 && $value <= 251, "test value: $value" );
        $n++;
    }

}


done_testing();
