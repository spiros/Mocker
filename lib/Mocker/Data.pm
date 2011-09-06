use strict;
use warnings;

package Mocker::Data;
# ABSTRACT: Data super class

use Mouse;

has 'value' => ( is => 'rw', isa => 'Any', builder => 'generate', lazy => 1 );
has 'units' => ( is => 'rw', isa => 'Str'                                   );

1;
