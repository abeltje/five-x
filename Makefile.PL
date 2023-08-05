#! perl
use warnings;
use strict;
use v5.10;

use ExtUtils::MakeMaker;

WriteMakefile(
    VERSION_FROM     => 'lib/Five/X.pm',
    NAME             => 'Five::X',
    ABSTRACT_FROM    => 'lib/Five/X.pm',
    MIN_PERL_VERSION => v5.10,

    BUILD_REQUIRES => {
        'Test::Simple'   => 0.88,
        'Test::Warnings' => 0,
    },
);
