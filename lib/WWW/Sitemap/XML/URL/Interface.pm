use strict;
use warnings;
package WWW::Sitemap::XML::URL::Interface;
BEGIN {
  $WWW::Sitemap::XML::URL::Interface::AUTHORITY = 'cpan:AJGB';
}
BEGIN {
  $WWW::Sitemap::XML::URL::Interface::VERSION = '1.103270';
}
use Moose::Role;
#ABSTRACT: Abstract interface for sitemap's URL classes

requires qw(
    loc lastmod changefreq priority as_xml
);


no Moose::Role;

1;


__END__
=pod

=encoding utf-8

=head1 NAME

WWW::Sitemap::XML::URL::Interface - Abstract interface for sitemap's URL classes

=head1 VERSION

version 1.103270

=head1 SYNOPSIS

    package My::Sitemap::URL;
    use Moose;

    has [qw( loc lastmod changefreq priority as_xml )] => (
        is => 'rw',
        isa => 'Str',
    );

    with 'WWW::Sitemap::XML::URL::Interface';

=head1 DESCRIPTION

Abstract interface for URL elements added to sitemap.

=head1 ABSTRACT METHODS

=head2 loc

URL of the page.

=head2 lastmod

The date of last modification of the file.

=head2 changefreq

How frequently the page is likely to change.

=head2 priority

The priority of this URL relative to other URLs on your site.

=head2 as_xml

XML representing the C<E<lt>urlE<gt>> entry in the sitemap.

=head1 SEE ALSO

=over 4

=item *

L<WWW::Sitemap::XML>

=back

=head1 AUTHOR

Alex J. G. Burzyński <ajgb@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Alex J. G. Burzyński <ajgb@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

