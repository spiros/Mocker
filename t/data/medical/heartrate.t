use strict;
use warnings;

use Test::More;

use_ok('Mocker::Data::Medical::HeartRate');

my $n = 0;
while ( $n <= 1000 ){
    
    my $Mocker = Mocker::Data::Medical::HeartRate->new();
    my $value = $Mocker->value;
    ok( $value >= 30 && $value <= 220, "test value: $value" );
    $n++;
    
}

done_testing();
