# Public: Install gcc via homebrew
#
# Examples
#
#   include gcc
class gcc {

  case $::operatingsystem {
    'Darwin': {
      include homebrew

      case $::macosx_productversion_major {
        '10.8': {
          homebrew::formula { 'apple-gcc42':
            before => Package['boxen/brews/apple-gcc42'],
          }

          package { 'boxen/brews/apple-gcc42':
            ensure => '4.2.1-5666.3-boxen1'
          }
        }

        '10.9': {
          exec { 'brew tap homebrew/versions':
            creates => "${boxen::config::home}/homebrew/Library/Taps/homebrew-versions"
          }

          package { 'homebrew/versions/gcc48':
            require => Exec['brew tap homebrew/versions']
          }
        }

        default: {
          # noop
        }
      }
    }

    default: {
      package { 'gcc': }
    }
  }

}
