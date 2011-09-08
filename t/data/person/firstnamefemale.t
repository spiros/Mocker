use strict;
use warnings;

use Test::More;

use_ok('Mocker::Data::Person::FirstNameFemale');

{
    my $Mocker = Mocker::Data::Person::FirstNameFemale->new();
    my $n = 0;
    while ( $n <= 1000 ){
        $Mocker->clear;
        my $value = $Mocker->value;
        ok( defined $value, "test value: $value" );
        $n++;
    }

}


done_testing();
