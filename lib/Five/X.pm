package Five::X;
use warnings;
use strict;
use v5.10;

our $VERSION = '0.03';

sub import {
    my $class = shift;
    my ($version, $label) = @_;
    $version = sprintf("%1.03f", $version // $]);
    $label //= '';

    my @features = @{ Five::X::features($version) };
    my @unfeatures = @{ Five::X::unfeatures($version) };
    my @experimental = ();

    warnings->import();
    strict->import();

    if ($label and $label eq ':experimental') {
        @experimental = @{ Five::X::experimental_warnings($]) };
        warnings->unimport(@experimental);
        @features = @{ Five::X::all_features($version) };
    }

    {
        no strict 'refs';
        no warnings 'once';
        say "# F = @{[ @features ]}\n# E = @{[ @experimental ]}\n# U = @{[ @unfeatures ]}"
            if ${"$class\::DEBUG"};
    }

    require feature;
    feature->import($_)   for @features;
    feature->unimport($_) for @unfeatures;
}

my $features;
my (%f_by_v, %e_by_v);
{ # We have a data structure in lib/Five/Features.pl with features
    use File::Basename;
    use File::Spec::Functions qw/ catfile /;
    use Cwd qw/ abs_path /;
    my $dir = abs_path(dirname( __FILE__ ));
    my $file = catfile($dir, 'Features.pl');

    our $Features; do $file;
    %$features = %$Features;

    for my $feature (keys %$features) {
        my $data = $features->{$feature};
        push(@{$f_by_v{ $data->{min} }}, $feature);
        if ($data->{exp}) {
            my ($emin, $emax) = split(m{-}, $data->{exp});
            push(@{$e_by_v{ $emin }}, $feature);
        }
    }
}

sub experimental_versions {
    return sort keys %e_by_v;
}

sub experimental_warnings {
    my ($version) = @_;
    my @cat = ();
    for my $ver ( sort keys %e_by_v ) {
        last if $ver > $version;
        for my $feature (@{ $e_by_v{$ver} }) {
            my $data = $features->{$feature};
            my ($emin, $emax) = split(m{-}, $data->{exp} // '');
            next if $emax and $emax < $version;
            my $cat = "experimental::" . ($data->{cat} // $feature);
            push(@cat, $cat);
        }
    }
    return [sort @cat];
}

sub features {
    my ($version) = @_;
    my @feat = ();

    for my $ver ( sort keys %f_by_v ) {
        last if $ver > $version;
        for my $feature (@{ $f_by_v{$ver} }) {
            my $data = $features->{$feature};
            next if $data->{off} and $data->{off} <= $version;
            next if $data->{max} and $] > $data->{max};
            my ($emin, $emax) = split(m{-}, $data->{exp} // '');
            next if $emin and not $emax and $emin <= $version;
            next if $emax and $emax < $version;
            next if $data->{core} and $version >= $data->{core};
            push(@feat, $feature);
        }
    }

    return [sort @feat];
}

sub all_features {
    my ($version) = @_;
    my @feat = ();

    for my $ver ( sort keys %f_by_v ) {
        last if $ver > $version;
        for my $feature (@{ $f_by_v{$ver} }) {
            my $data = $features->{$feature};
            next if $data->{off} and $data->{off} <= $version;
            next if $data->{max} and $] > $data->{max};
            next if $data->{core} and $version >= $data->{core};
            push(@feat, $feature);
        }
    }

    return [sort @feat];
}

sub unfeatures {
    my ($version) = @_;
    my @unfeat = ();

    for my $ver ( sort keys %f_by_v ) {
        last if $ver > $version;
        for my $feature (@{ $f_by_v{$ver} }) {
            my $data = $features->{$feature};
            next unless $data->{off} and $data->{off} <= $version;
            push(@unfeat, $feature);
        }
    }

    return [sort @unfeat];
}

1;

=head1 NAME

Five::X - A set of modules that enable strict and warnings and features

=head1 SYNOPSIS

    #! /usr/bin/perl
    use Five::Ten; # use feature ':5.10'; use strict; use warnings;
    say "Turned on features for 5.10";

=head1 DESCRIPTION

Either of these modules turns on strict, warnings and features in the calling package.

I have tried to document all the new features/experimentals per version. To
understand what a feature or experimental is, one should read the I<perldelta>
document for that version.

=head2 Experimental

Starting with perl version 5.18, some features are experimental and will warn in
the catagory C<< experimental::<feature> >>. These will not be switched on by
default, you'll have to add the ':experimental' tag to enable these features and
disable the warnings that come with them.

=head2 experimental_versions

Returns an ordered list of versions that have warings in the C<experimental::>
class without a feature category.

=head2 experimental_warnings($version)

Returns a listref of the warnings in the C<experimental::> class for the given
perl version.

=head2 features($version)

This returns a ref to a list of feature-names that are available in C<$version>
that are not marked as experimental.

Keep in mind features can be removed (like B<autoderef>) and will not show if
the actual version of perl doesn't have them anymore.

=head2 all_features

This returns a ref to a list of feature-names that ar available in C<$version>,
including the features marked as experimental.

=head2 unfeatures($version)

Newer versions of perl have features that one would like to turn off as the
syntax they represent is discouraged. All the C<Five::X> do this by default. If
one wants indirect object syntax under L<Five::ThirtyTwo> or higher one must
explicitly turn it on:

    use feature 'indirect';

=head1 SEE ALSO

L<Five::Ten> L<Five::Twelve> L<Five::Fourteen> L<Five::Sixteen> L<Five::Eigtteen>

L<Five::Twenty> L<Five::Twentytwo> L<Five::Twentyfour> L<Five::Twentysix> L<Five::Twentyeight>

L<Five::Thirty> L<Five::Thirtytwo> L<Five::Thirtyfour> L<Five::Thirtysix> L<Five::Thirtyeight>

=head1 COPYRIGHT

E<copy> MMXXIII - Abe Timmerman <abeltje@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut
