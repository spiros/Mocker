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
    
    'rows' => 100,
    
    'output' => {
        'target' => 'file',
        'filename' => '/tmp/moo.txt'
    }
    
};

my $Mocker = Mocker->new( $rh_configuration );

isa_ok($Mocker, 'Mocker');

$Mocker->generate;

done_testing();