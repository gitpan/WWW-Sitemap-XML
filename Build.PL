
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
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
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "XML Sitemap protocol",
  "dist_author" => [
    "Alex J. G. Burzy\305\204ski <ajgb\@cpan.org>"
  ],
  "dist_name" => "WWW-Sitemap-XML",
  "dist_version" => "1.121160",
  "license" => "perl",
  "module_name" => "WWW::Sitemap::XML",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
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
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
