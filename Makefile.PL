#! perl
use warnings;
use strict;

use ExtUtils::MakeMaker;

WriteMakefile(
    VERSION_FROM  => 'lib/Five/X.pm',
    NAME          => 'Five::X',
    ABSTRACT_FROM => 'lib/Five/X.pm',
    BUILD_REQUIRES => {
        'Test::NoWarnings' => 0,
    },
);
