#! perl -w
use strict;
use Test::More;

$ENV{RELEASE_TESTING} = 1;
use Test::Kwalitee 'kwalitee_ok';

kwalitee_ok();

done_testing();
