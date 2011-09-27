use strict;
use warnings;

package Mocker::Writer::File;
# ABSTRACT: write things to a file

use Mocker::Combiner;
use Carp;

=head2 new

Create a new instance of the class.
This method returns I<undef> on error.

=cut

sub new {
    my $class     = shift;
    my $rh_params = shift;
    my $self      = { };
    $self->{combiner} = Mocker::Combiner->new();

    my $filename = $rh_params->{filename};

    unless ( defined $filename ) {
        croak "You must specify a filename for the file output type.";
    }
    
    unless ( ! -e $filename ){
        croak "The filename $filename exists."
    }
    
    my $fh;
    open $fh, '>', $filename 
        || croak "Could not open $filename for writing.";
        
    $self->{fh} = $fh;
    return bless $self, $class;
}

sub write_row {
    my $self    = shift;
    my $ra_row  = shift;
    
    my $rv = 
        $self->{combiner}->combine( @$ra_row );
    
    my $fh = $self->{fh};
    
    if ( $rv ) {
        printf $fh ("%s\n", $self->{combiner}->string );
    }
    
    else {
        return undef;
    }
}

1;