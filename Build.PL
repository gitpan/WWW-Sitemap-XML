
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'IO::File' => '0',
    'Module::Build' => '0.3601',
    'Test::Exception' => '0',
    'Test::More' => '0',
    'Test::NoWarnings' => '0',
    'URI' => '0'
  },
  'configure_requires' => {
    'ExtUtils::MakeMaker' => '6.31',
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'XML Sitemap protocol',
  'dist_author' => [
    'Alex J. G. Burzyński <ajgb@cpan.org>'
  ],
  'dist_name' => 'WWW-Sitemap-XML',
  'dist_version' => '1.103270',
  'license' => 'perl',
  'module_name' => 'WWW::Sitemap::XML',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'IO::Zlib' => '0',
    'Moose' => '0',
    'Moose::Role' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'MooseX::Types' => '0',
    'MooseX::Types::DateTime::W3C' => '0',
    'MooseX::Types::Moose' => '0',
    'MooseX::Types::URI' => '0',
    'Scalar::Util' => '0',
    'XML::Twig' => '0'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
