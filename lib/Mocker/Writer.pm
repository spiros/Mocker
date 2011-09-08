use strict;
use warnings;

package Mocker::Writer;
# ABSTRACT: Data writer class.

use Text::CSV;
use Carp;

use Mocker::Writer::Screen;
use Mocker::Writer::File;

=head2 new

Create a new instance of the class.
This method returns I<undef> on error.

=cut

sub new {
    my $class     = shift;
    my $rh_params = shift;
    
    my $Combiner = Mocker::Combiner->new();
    
    if ( $rh_params->{target} eq 'screen' ){
        return Mocker::Writer::Screen->new( $rh_params );
    } 
    
    elsif ( $rh_params->{target} eq 'file' ){
        return Mocker::Writer::File->new( $rh_params );
    } 
    
    else {
        croak "Unknown target type for output."
    } 

}

1;