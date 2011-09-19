Mocker: generate fake data with Perl

```perl
use Mocker;

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
        },
        
        'number' => {
            'order' => 3,
            'min' => 10,
            'max' => 20,
            'round' => 1,
        }
        
    },
    
    'rows' => 100,
    
    'output' => {
        'target'   => 'screen',
    }
    
};

my $Mocker = Mocker->new( $rh_configuration );

$Mocker->generate;
```