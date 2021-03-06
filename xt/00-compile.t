#! perl -w
use v5.8.4;
use warnings;

use File::Find;
use File::Spec::Functions;

use Test::More;
Test::Compile->import('compiles_ok');

my @to_compile;
find sub {
    -f or return;
    /\.pm$/ or return;
    push @to_compile, $File::Find::name;
}, catdir('lib', 'Five');

my %map = (
    '5.022' => 'TwentyTwo',
    '5.020' => 'Twenty',
    '5.018' => 'Eighteen',
    '5.016' => 'Sixteen',
    '5.014' => 'Fourteen',
    '5.012' => 'Twelve',
    '5.010' => 'Ten',
    '5.008' => 'Eight',
);
for my $version (sort keys %map) {
    next if $] > $version;
    @to_compile = grep !m{lib/Five/$map{$version}.pm}, @to_compile;
}

compiles_ok($_) for @to_compile;

done_testing();


BEGIN {
    package Test::Compile;
    use warnings;
    use strict;

    use base 'Test::Builder::Module';
    use Exporter 'import';
    our @EXPORT = qw/compiles_ok/;

    my $tb = __PACKAGE__->builder;

    sub compiles_ok {
        my ($filename, $msg) = @_;
        $msg //= "compile '$filename'";

        my $libs = '-Ilib';
        if (grep m{^blib/} => @INC) {
            $libs .= ' -Mblib';
        }
        my @compile_errors = grep {
            $tb->note("[RAW] $_");
               $_ !~ m{^.+ syntax OK}
            && $_ !~ m{^.+ had compilation errors}
        } do {
            local $ENV{PATH} = $ENV{PATH} =~ /^(.+)$/ ? $1 : undef;
            local $ENV{PERL5LIB} = join(':', @INC, ($ENV{PERL5LIB} // ''));
            my $perl_bin = $^X =~ /^(.+)$/ ? $1 : 'perl';
            qx{$perl_bin $libs -wc $filename 2>&1};
        };

        if (@compile_errors) {
            my $ok = $tb->ok(0, $msg);
            for my $error (@compile_errors) {
                $tb->diag($error);
            }
            return $ok;
        }
        return $tb->ok(1, $msg);
    }

    1;
}
