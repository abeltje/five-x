#! perl
use warnings;
use strict;

use ExtUtils::MakeMaker;

WriteMakefile(
    VERSION_FROM  => 'lib/Five/X.pm',
    NAME          => 'FiveX',
    ABSTRACT_FROM => 'lib/Five/X.pm',
);
