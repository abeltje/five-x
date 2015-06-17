package Five::Eight;
use 5.008;
use warnings;
use strict;

sub import {
    warnings->import();
    strict->import();
}

1;

=head1 NAME

Five::Eight - Enable 'strict' and 'warnings' in the calling code

=head1 SYNOPSIS

    package MyPackage;
    use Five::Eight;
    # strict and warnings

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
