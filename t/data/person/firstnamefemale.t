use strict;
use warnings;

use Test::More;

use_ok('Mocker::Data::Person::FirstNameFemale');

{
    my $n = 0;
    while ( $n <= 1000 ){
    
        my $Mocker = Mocker::Data::Person::FirstNameFemale->new();
        my $value = $Mocker->value;
        ok( defined $value, "test value: $value" );
        $n++;
    }

}


done_testing();
