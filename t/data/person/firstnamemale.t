use strict;
use warnings;

use Test::More;

use_ok('Mocker::Data::Person::FirstNameMale');

{
    my $Mocker = Mocker::Data::Person::FirstNameMale->new();
    my $n = 0;
    while ( $n <= 1000 ){
        $Mocker->clear;
        my $value = $Mocker->value;
        ok( defined $value, "test value: $value" );
        $n++;
    }

}


done_testing();
