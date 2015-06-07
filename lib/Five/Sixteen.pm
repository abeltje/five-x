package Five::Sixteen;
use 5.016;
use warnings;
use strict;
use feature ':5.16';

sub import {
    my $class = shift;
    warnings->import();
    strict->import();
    feature->import(':5.16');
}

1;

=head1 NAME

Five::Sixteen - Enable 'strict', 'warnings' and 'features :5.16' in the calling code

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
