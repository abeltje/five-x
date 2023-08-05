package Five::Thirtyeight;
use warnings;
use strict;
use v5.38;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.038", @_);
}

1;

=head1 NAME

Five::Thirtyeight - Enable 'strict', 'warnings' and 'features :5.38' in the calling code

=head1 SYNOPSIS

    use Five::Thirtyeight ':experimental';

=head1 DESCRIPTION

=head2 feautures

=over

=item B<class>

=back

=head2 experimental features turned off (unfeature)

These features are no longer part of the C<:5.38> feature-bundle:

=over

=item B<switch>

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
