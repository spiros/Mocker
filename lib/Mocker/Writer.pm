use strict;
use warnings;

package Mocker::Writer;
# ABSTRACT: Data writer class.

use Text::CSV;

sub new {
    my $class = shift;
    my $self  = { };
    
    $self->{csv} = Text::CSV->new();
    bless $self, $class;
    return $self;
    
}

sub write_row {
    my $self    = shift;
    my $ra_row  = shift;
    
    my $rv = $self->{csv}->combine( @$ra_row );
    
    if ( $rv ) {
        printf STDERR ("%s\n", $self->{csv}->string );
    }
    
    else {
        return undef;
    }
}

1;