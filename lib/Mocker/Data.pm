use strict;
use warnings;

package Mocker::Data;
# ABSTRACT: Data super class

use Mouse;

has 'order' => ( is => 'rw', isa => 'Int' );
has 'value' => ( is => 'rw', isa => 'Any', clearer => 'clear', builder => 'generate', lazy => 1 );
has 'units' => ( is => 'rw', isa => 'Str'                                   );

has 'min'   => ( is => 'rw', isa => 'Num' );
has 'max'   => ( is => 'rw', isa => 'Num' );
has 'round' => ( is => 'rw', isa => 'Int' );

has 'nicename'     => ( is => 'rw', isa => 'Str' );

1;
