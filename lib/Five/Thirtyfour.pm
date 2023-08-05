package Five::Thirtyfour;
use warnings;
use strict;
use v5.34;

use Five::X;

our $DEBUG //= 0;

sub import {
    my $class = shift;
    my ($label) = @_;

    my @features = @{ Five::X::features("5.034") };
    my @unfeatures = @{ Five::X::unfeatures("5.034") };
    my @experimental = ();

    warnings->import();
    strict->import();

    if ($label and $label eq ':experimental') {
        @experimental = @{ Five::X::experimental_warnings($]) };
        warnings->unimport(@experimental);
        @features = @{ Five::X::all_features("5.034") };
    }
    say "F = @{[ @features ]}\nE = @{[ @experimental ]}\nU = @{[ @unfeatures ]}"
        if $DEBUG;
    require feature;
    feature->import($_) for @features;
    feature->unimport($_) for @unfeatures;
}

1;

=head1 NAME

Five::Thirtyfour - Enable 'strict', 'warnings' and 'features :5.34' in the calling code

=head1 SYNOPSIS

    use Five::Thirtyfour ':experimental';

=head1 DESCRIPTION

=head2 feautures

=over

=item B<try>

=item B<bareword_filehandles> [off]

=item B<multidimentional>     [off]

=back

=head1 COPYRIGHT

(c) MMXXIII - Abe Timmerman <abeltje@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut
