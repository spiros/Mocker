use strict;
use warnings;

use Test::More;

use_ok('Mocker');

my $rh_configuration = { 
    
    'variables' => {
        
        'gender' => {
            'order' => 0
        },
        
        'surname' => {
            'order' => 1
        },
        
        'weight' => {
            'order' => 2
        }
        
    },
    
    'rows' => 50,
    
};

my $Mocker = Mocker->new( $rh_configuration );

isa_ok($Mocker, 'Mocker');

done_testing();