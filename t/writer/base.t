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
    
    use File::Temp qw/ tempfile tempdir /;

    my $tmp_dir = tempdir( CLEANUP => 1 );
    my $tmp_filename = sprintf('%s/%d', $tmp_dir, time );
    
    my $rh_params = {
        target => 'file',
        filename => $tmp_filename
    };

    my $Writer = Mocker::Writer->new( $rh_params );

    isa_ok( $Writer, 'Mocker::Writer::File' );
    
}

done_testing();
