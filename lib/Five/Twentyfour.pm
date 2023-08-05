package Five::Twentyfour;
use warnings;
use strict;
use v5.24;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.024", @_);
}

1;

=head1 NAME

Five::Twentyfour - Enable 'strict', 'warnings' and 'features :5.24' in the calling code

=head1 SYNOPSIS

    use Five::Twentyfour ':experimental';

=head1 DESCRIPTION

=head2 feautures

No actual features in 5.24.

=head2 features promoted to core

These features have been promoted to core perl and don't need a C<< use feature
... >> anymore.

=over

=item B<postderef>

=item B<postderef_qq>

=back

=head2 (experimental) features removed

=over

=item B<autoderef>

=item B<my $_>

=back

=head1 COPYRIGHT

E<copy> MMXV - Abe Timmerman <abeltje@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut
