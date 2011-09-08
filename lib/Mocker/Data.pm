use strict;
use warnings;

package Mocker::Data;
# ABSTRACT: Data super class

use Mouse;

has 'order' => ( is => 'rw', isa => 'Int' );
has 'value' => ( is => 'rw', isa => 'Any', clearer => 'clear', builder => 'generate', lazy => 1 );
has 'units' => ( is => 'rw', isa => 'Str'                                   );

1;
