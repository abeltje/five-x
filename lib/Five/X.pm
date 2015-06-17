package Five::X;

our $VERSION = '0.01';

use Exporter 'import';
our @EXPORT = qw/ experimental_versions experimental_warnings /;

# These are experimental warnings without a feature, and backward incompatible!
# I'd like to say: use Five::Ten ':experimental';
# and be able to use given/when on 5.18
my %experimental = (
    '5.018' => [qw/experimental::smartmatch/],
    '5.020' => [qw/experimental::autoderef/],
    '5.022' => [qw/experimental::const_attr/],
);

sub experimental_versions {
    return sort keys %experimental;
}

sub experimental_warnings {
    my ($version) = @_;
    return [ ] if !exists $experimental{$version};
    return $experimental{$version};
}

=head1 NAME

FiveX - A set of modules that enable strict and warnings and features

=head1 SYNOPSIS

    #! /usr/bin/perl
    use Five::Ten; # use 5.010; use feature ':5.10'; use strict; use warnings;
    say "Turned on features for 5.10";

=head1 DESCRIPTION

Either of these modules turns on strict, warnings and features in the calling package.

=head2 use feature

Starting with perl version 5.18, some features are experimental. These will
not be switched on by default, you'll have to add the ':experimental' tag.

=head2 experimental_versions

Returns an ordered list of versions that have warings in the C<experimental::>
class without a feature category.

=head2 experimental_warnings($version)

Returns a listref of the warnings in the C<experimental::> class for the given
perl version.

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
