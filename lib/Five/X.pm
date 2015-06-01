package Five::X;

our $VESION = '0.01';

=head1 NAME

Five::X - A set of 'Modern Perl'ish modules that enable strict, warnings and features

=head1 SYNOPSIS

    #! /usr/bin/perl
    use Five::Ten; # use 5.010; use feature ':5.10'; use strict; use warnings;
    say "Turned on features for 5.10";

=head1 DESCRIPTION

Either of these modules turns on strict, warnings and features in the calling package.

=head2 use feature

Starting with perl version 5.18, some features are experimental. These will
not be switched on by default, you'll have to add the ':experimental' tag.

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
