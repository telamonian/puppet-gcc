# Public: Install apple-gcc42 via homebrew
#
# Examples
#
#   include gcc::gcc_42
class gcc::gcc_42 {
  case $::operatingsystem {
    'Darwin': {
      include homebrew

      homebrew::formula { 'apple-gcc42':
        before => Package['boxen/brews/apple-gcc42'],
      }

      package { 'boxen/brews/apple-gcc42':
        ensure => '4.2.1-5666.3-boxen1'
      }
    }

    default: {
      # noop
    }
  }
}
