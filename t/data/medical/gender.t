use strict;
use warnings;

use Test::More;

use_ok('Mocker::Data::Medical::Gender');

{

    my $rh_expected_genders = { 
        'male' => 1,
        'female' => 1,
        'indeterminate' => 1
        };
    
    my $Mocker = Mocker::Data::Medical::Gender->new();
    my $n = 0;
    while ( $n <= 1000 ){
        $Mocker->clear;
        my $value = $Mocker->value;
        ok( exists $rh_expected_genders->{$value}, "test value: $value" );
        $n++;
    }

}


done_testing();
