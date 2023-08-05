#! perl
use utf8;
use Test::More;
BEGIN { $] < 5.036 and plan skip_all => "Not perl 5.36 yet: $]"; }
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

BEGIN { $Five::Thirtysix::DEBUG = $ENV{TEST_DEBUG}; }
use Five::Thirtysix ':experimental';

{
    note("try/catch (experimental)");
    my $prog = <<'EOP1';
try {
    die "Oeps!\n";
}
catch ($e) {
    is($e, "Oeps!\n", "Caught the exception");
}
42;
EOP1
    my $ok = eval $prog;
    my $error = $@;
    is($error, "", "try/catch compiles");
    is($ok, 42, "try/catch works");
}

{
    note("defer (experimental)");
    my $global = 0;
    my $prog = <<'EOP2';
sub with_defer {
    defer { $global = 42; }
    is($global, 0, "Nothing to see here $global");
    return 100;
}
my $x = with_defer();
is($x, 100, "return worked");
42;
EOP2
    my $ok = eval $prog;
    my $error = $@;
    is($@, "", "defer blocks compile");
    is($global, 42, "defer worked");
    is($ok, 42, "defer blocks work");
}

{
    my $stdout = Test::More->builder->output; # no feature "bareword_filehandles"
    binmode($stdout, ':utf8');
    note("extra_paired_delimiters (experimental)");
    my $prog = <<'EOP3';
qq«French quotes»
EOP3
    my $ok = eval $prog;
    my $error = $@;
    is($@, "", "French quotes («») as delimeter compile");
    is($ok, 'French quotes', "extra_paired_delimiters work");
}

done_testing();
