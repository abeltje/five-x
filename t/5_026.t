#! perl
use Test::More;
BEGIN { $] < 5.026 and plan skip_all => "Not perl 5.26 yet: $]"; }
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

BEGIN { $Five::Twentysix::DEBUG = $ENV{TEST_DEBUG}; }
use Five::Twentysix ':experimental';

{
    note("indented Here-documents");
    my $prog = <<'EOP';
    my $string = <<~ 'EOS';
        Not indented 42
        EOS
    $string;
EOP
    my $ok = eval $prog;
    my $error = $@;
    is($@, "", "New indented here-document compiles");
    is($ok, "Not indented 42\n", "indented here-document works");
}

{
    note("feature declared_refs");
    my $orig = \(my $str = "Orig 42");
    my $prog = <<~ 'EOP';
        my \$ref = \$orig;
        $$ref;
        EOP
    my $ok = eval $prog;
    my $error = $@;
    is($error, "", "declared_ref compiles");
    is($ok, $$orig, "declared_ref works");
}

{
    note("lexical subs in core");
    no feature ':5.26';
    {
        my sub xxx { 42 };
        is(xxx(), 42, "Lexical subroutine is callable");
    }
    my $nok = eval "xxx()";
    my $error = $@;
    like(
        $error,
        qr/^\QUndefined subroutine &main::xxx called at\E/,
        "Lexical subroutine not available outside scope"
    );
}

done_testing();;
