#!/usr/bin/perl

use strict;
use warnings;

use Mocker;

my $rh_configuration = { 
    
    'variables' => {
        
        'first_name_male' => {
            'order' => 0
        },
        
        'number' => {
            'order' => 1,
            'min' => 1,
            'max' => 5000,
            'nicename' => 'random1',
        }
        
    },
    
    'rows' => 500,
    
    'output' => {
        'target'   => 'file',
        'filename' => 'testdata.csv'
    }
    
};

my $Mocker = Mocker->new( $rh_configuration );

$Mocker->generate;