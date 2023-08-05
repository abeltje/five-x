#! /usr/bin/env perl
use warnings;
use strict;

my %opt = (
    infile  => 'contrib/Features.yml',
    outfile => 'contrib/Features.pl',
);
use Getopt::Long;
GetOptions(
    \%opt => qw<
        infile|i=s
        outfile|o=s
    >
);

use YAML::XS qw<LoadFile>;
use Data::Dumper;

my $features = LoadFile($opt{infile}) or die "Problem with yaml";

my $dd = Data::Dumper->new([$features], ['Features'])->Indent(1)->Sortkeys(1);
print my $features = $dd->Dump;
print "Writing to $opt{outfile}\n";

local $ENV{PERL_USE_UNSAFE_INC} = 1;
open(my $oh, '>', $opt{outfile}) or die "Cannot create($opt{outfile}): $!";
print {$oh} $features;
close($oh);
