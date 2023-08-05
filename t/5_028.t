#! perl
use Test::More;
BEGIN { $] < 5.028 and plan skip_all => "Not perl 5.28 yet: $]"; }
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

BEGIN { $Five::Twentyeight::DEBUG = $ENV{TEST_DEBUG}; }
use Five::Twentyeight ':experimental';

{
    my $prog = <<~ 'EOP';
        "positive_lookahead" =~ m{(*pla:\w+)_(lookahead)} ? $1 : 42;
        EOP
    my $ok = eval $prog;
    my $error = $@;
    is($error, "", "alpha_assertions compile");
    is($ok, "lookahead", "alpha_assertions work");
}

{
    my ($none) = grep {
        /^experimental::bitwise$/
    } @{ Five::X::experimental_warnings("5.028") };
    is($none, undef, "No experimental::bitwise in 5.28");

    my $prog = <<~ 'EOP';
        "10b" |. "21a"
        EOP
    my $ok = eval $prog;
    my $error = $@;
    is($error, "", "new string-bitwise operater compiles");
    is($ok, "31c", "new string-bitwise operator works");
}

done_testing();
