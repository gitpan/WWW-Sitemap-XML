
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "XML Sitemap protocol",
  "AUTHOR" => "Alex J. G. Burzy\305\204ski <ajgb\@cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "IO::File" => 0,
    "IO::Zlib" => 0,
    "Module::Build" => "0.3601",
    "Test::Exception" => 0,
    "Test::More" => 0,
    "Test::NoWarnings" => 0,
    "URI" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "WWW-Sitemap-XML",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "WWW::Sitemap::XML",
  "PREREQ_PM" => {
    "Moose" => "1.26",
    "Moose::Role" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "MooseX::Types" => 0,
    "MooseX::Types::DateTime::W3C" => 0,
    "MooseX::Types::Moose" => 0,
    "MooseX::Types::URI" => 0,
    "Scalar::Util" => 0,
    "XML::LibXML" => "1.70",
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.121160",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



