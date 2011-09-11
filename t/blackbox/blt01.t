use strict;
use warnings;

use Test::More;
use File::Temp qw/ tempfile tempdir /;

use_ok('Mocker');

my $tmp_dir = tempdir( CLEANUP => 1 );
my ($tmp_fh, $tmp_filename) = tempfile( DIR => $tmp_dir );

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
        'target'   => 'file',
        'filename' => $tmp_filename
    }
    
};

my $Mocker = Mocker->new( $rh_configuration );

isa_ok($Mocker, 'Mocker');

$Mocker->generate;

done_testing();