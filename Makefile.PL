
use strict;
use warnings;

BEGIN { require 5.010; }

use ExtUtils::MakeMaker 6.31;

use File::ShareDir::Install;
install_share dist => "share";


my %WriteMakefileArgs = (
  'ABSTRACT' => 'Examine Yr Moose',
  'AUTHOR' => 'John SJ Anderson <genehack@genehack.org>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'Moose::Role' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31',
    'File::ShareDir::Install' => '0.03'
  },
  'DISTNAME' => 'MooseX-amine',
  'EXE_FILES' => [
    'bin/list_methods_for_native_trait',
    'bin/mex',
    'bin/mexi'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'MooseX::amine',
  'PREREQ_PM' => {
    'Dancer' => '0',
    'File::Find::Rule' => '0',
    'File::ShareDir' => '0',
    'File::Spec' => '0',
    'Hash::Merge' => '0',
    'List::Util' => '0',
    'Modern::Perl' => '0',
    'Module::Info' => '0',
    'Moose' => '2.000',
    'Moose::Meta::Class' => '0',
    'Moose::Meta::Role' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'PPI' => '0',
    'Template' => '0',
    'Test::Deep::NoTest' => '0',
    'Try::Tiny' => '0',
    'autodie' => '0'
  },
  'VERSION' => '0.3',
  'test' => {
    'TESTS' => 't/*.t'
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

package
MY;
use File::ShareDir::Install qw(postamble);


