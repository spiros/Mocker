use strict;
use warnings;

use Test::More;

use_ok('Mocker::Data::Number');

{
    
    my $rh_params = {
        min => 0,
        max => 100
    };

    my $Mocker = 
        Mocker::Data::Number->new( $rh_params );

    isa_ok( $Mocker, 'Mocker::Data::Number' );

    my $n = 0;
    while ( $n <= 1000 ){
        $Mocker->clear;
        my $value = $Mocker->value;
        ok( $value >= 0 && $value <= 100 , "test value: $value" );
        $n++;
    }

}

{
    
    my $rh_params = {
        min => -50,
        max => 10
    };

    my $Mocker = 
        Mocker::Data::Number->new( $rh_params );

    isa_ok( $Mocker, 'Mocker::Data::Number' );

    my $n = 0;
    while ( $n <= 1000 ){
        $Mocker->clear;
        my $value = $Mocker->value;
        ok( $value >= -50 && $value <= 10 , "test value: $value" );
        $n++;
    }

}

done_testing;