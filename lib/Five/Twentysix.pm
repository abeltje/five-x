package Five::Twentysix;
use warnings;
use strict;
use v5.26;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.026", @_);
}

1;

=head1 NAME

Five::Twentysix - Enable 'strict', 'warnings' and 'features :5.22' in the calling code

=head1 SYNOPSIS

    package MyPackage;
    use Five::Twentysix;
    # strict, warnings and featere :5.26

=head1 DESCRIPTION

Without feature, see L<|perl5260delta>.

=over

=item B<Indented Here-documents>

=back

=head2 features

=over

=item B<declared_refs> (experimental)

=back

=head2 features promoted to core

=over

=item B<lexical_subs>

=back

=head2 features removed

None.

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut
