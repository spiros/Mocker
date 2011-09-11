use strict;
use warnings;

use Test::More;

use_ok('Mocker::Writer');

{
    my $rh_params = {
        target => 'screen'
    };

    my $Writer = Mocker::Writer->new( $rh_params );

    isa_ok( $Writer, 'Mocker::Writer::Screen' );
    
}

{
    my $rh_params = {
        target => 'file',
        filename => '/tmp/moo'
    };

    my $Writer = Mocker::Writer->new( $rh_params );

    isa_ok( $Writer, 'Mocker::Writer::File' );
    
}

done_testing();
