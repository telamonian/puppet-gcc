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
          require gcc::gcc_42
        }

        '10.9': {
          ensure_resource('homebrew::tap', 'homebrew/versions', { 'ensure' => 'present' })

          package { 'homebrew/versions/gcc48':
            require => Homebrew::Tap['homebrew/versions']
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
