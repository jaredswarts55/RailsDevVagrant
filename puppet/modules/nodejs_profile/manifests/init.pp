
#######################
# NodeJS and Packages #
#######################

class nodejs_profile (
    $version = 'present',
    $manage_repo = true,
    $npms = []
) {
    class {'nodejs':
        manage_repo => $manage_repo,
        version => $version
    }

    each($npms) |$package,$version| {
        package { $package:
            ensure => present,
            provider => 'npm',
            require  => Class['nodejs']
        }
    }
}
