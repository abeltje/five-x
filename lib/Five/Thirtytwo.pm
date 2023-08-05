package Five::Thirtytwo;
use warnings;
use strict;
use v5.32;

use Five::X;

our $DEBUG //= 0;

sub import {
    my $class = shift;
    my ($label) = @_;

    my @features = @{ Five::X::features("5.032") };
    my @unfeatures = @{ Five::X::unfeatures("5.032") };
    my @experimental = ();

    warnings->import();
    strict->import();

    if ($label and $label eq ':experimental') {
        @experimental = @{ Five::X::experimental_warnings($]) };
        warnings->unimport(@experimental);
        @features = @{ Five::X::all_features("5.032") };
    }
    say "F = @{[ @features ]}\nE = @{[ @experimental ]}\nU = @{[ @unfeatures ]}"
        if $DEBUG;
    require feature;
    feature->import($_) for @features;
    feature->unimport($_) for @unfeatures;
}

1;

=head1 NAME

Five::Thirtytwo - Enable 'strict', 'warnings' and 'features :5.32' in the calling code

=head1 SYNOPSIS

    use Five::Thirtytwo ':experimental';

=head1 DESCRIPTION

=head2 feautures

=over

=item B<isa> (experimental)

=back

=head2 (experimental) features removed

These C<experimental::> warnings were removed:

=over

=item B<experimental::alpha_assertions> (introduced in 5.28)

=item B<experimental::script_run>       (introduced in 5.28)

=back

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut
