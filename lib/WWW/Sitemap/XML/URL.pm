use strict;
use warnings;
package WWW::Sitemap::XML::URL;
BEGIN {
  $WWW::Sitemap::XML::URL::AUTHORITY = 'cpan:AJGB';
}
BEGIN {
  $WWW::Sitemap::XML::URL::VERSION = '1.103270';
}
#ABSTRACT: XML Sitemap url entry

use Moose;
use WWW::Sitemap::XML::Types qw( Location ChangeFreq Priority );
use MooseX::Types::DateTime::W3C qw( DateTimeW3C );
use XML::Twig ();



has 'loc' => (
    is => 'rw',
    isa => Location,
    required => 1,
    coerce => 1,
    predicate => 'has_loc',
);


has 'lastmod' => (
    is => 'rw',
    isa => DateTimeW3C,
    required => 0,
    coerce => 1,
    predicate => 'has_lastmod',
);


has 'changefreq' => (
    is => 'rw',
    isa => ChangeFreq,
    required => 0,
    predicate => 'has_changefreq',
);


has 'priority' => (
    is => 'rw',
    isa => Priority,
    required => 0,
    predicate => 'has_priority',
);


sub as_xml {
    my $self = shift;

    return XML::Twig::Elt->new('url',
        XML::Twig::Elt->new('loc', $self->loc),
        map {
            XML::Twig::Elt->new($_, $self->$_())
        }
        grep {
            eval('$self->has_'.$_) || defined $self->$_()
        } qw( lastmod changefreq priority )
    );
}

around BUILDARGS => sub {
    my $next = shift;
    my $class = shift;

    if ( @_ == 1 && ! ref $_[0] ) {
        return $class->$next(loc => $_[0]);
    }
    return $class->$next( @_ );
};

with 'WWW::Sitemap::XML::URL::Interface';


__PACKAGE__->meta->make_immutable;

1;


__END__
=pod

=encoding utf-8

=head1 NAME

WWW::Sitemap::XML::URL - XML Sitemap url entry

=head1 VERSION

version 1.103270

=head1 SYNOPSIS

    my $url = WWW::Sitemap::XML::URL->new(
        loc => 'http://mywebsite.com/',
        lastmod => time(),
        changefreq => 'always',
        priority => 1.0,
    );

=head1 DESCRIPTION

WWW::Sitemap::XML::URL represents single url entry in sitemap file.

Implements L<WWW::Sitemap::XML::URL::Interface>.

=head1 ATTRIBUTES

=head2 loc

    $url->loc('http://mywebsite.com/')

URL of the page.

isa: L<WWW::Sitemap::XML::Types/"Location">

Required.

=head2 lastmod

The date of last modification of the file.

isa: L<MooseX::Types::DateTime::W3C/"DateTimeW3C">

Optional.

=head2 changefreq

How frequently the page is likely to change.

isa: L<WWW::Sitemap::XML::Types/"ChangeFreq">

Optional.

=head2 priority

The priority of this URL relative to other URLs on your site.

isa: L<WWW::Sitemap::XML::Types/"Priority">

Optional.

=head1 METHODS

=head2 as_xml

Returns L<XML::Twig::Elt|XML::Twig/XML::Twig::Elt>
object representing the C<E<lt>urlE<gt>> entry in the sitemap.

=head1 SEE ALSO

=over 4

=item *

L<WWW::Sitemap::XML>

=item *

L<http://www.sitemaps.org/protocol.php>

=back

=head1 AUTHOR

Alex J. G. Burzyński <ajgb@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Alex J. G. Burzyński <ajgb@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

