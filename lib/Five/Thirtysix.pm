package Five::Thirtysix;
use warnings;
use strict;
use v5.36;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.036", @_);
}

1;

=head1 NAME

Five::Thirtysix - Enable 'strict', 'warnings' and 'features :5.36' in the calling code

=head1 SYNOPSIS

    use Five::Thirtysix ':experimental';

=head1 DESCRIPTION

=head2 features no longer "on"

These features were removed from the C<:5.36> bundle:

=over

=item B<switch>

=back

=head2 features with experimental removed:

These features no longer warn:

=over

=item B<signatures>

=back

=head1 COPYRIGHT

E<copy> MMXXIII - Abe Timmerman <abeltje@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut
