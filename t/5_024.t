#! perl
use Test::More;
BEGIN { $] < 5.024 and plan skip_all => "Not perl 5.24 yet: $]"; }
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

BEGIN { $Five::Twentyfour::DEBUG = $ENV{TEST_DEBUG}; }
use Five::Twentyfour ':experimental';

{
    no feature ':5.24';
    my $prog = <<'EOP';
my $a = [ een => 2, drie => 4 ];
join(" ", $a->@*);
EOP
    my $ok = eval $prog;
    my $error = $@;
    is($error, "", "postderef still compiles");
    is($ok, "een 2 drie 4", "postderef still works");
}

done_testing();
