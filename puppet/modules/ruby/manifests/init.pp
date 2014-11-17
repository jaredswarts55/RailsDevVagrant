#######################
# RVM / Ruby and Gems #
#######################

class ruby (
    $ruby_version = "ruby-1.9",
    $system_users = [],
    $gemset_name = "ruby-1.9@vagrunt",
    $gems = []
) {
    include rvm

    # Ruby
    rvm_system_ruby {
        "$ruby_version":
            ensure => 'present',
            default_use => true;
    }

    # System Ruby User
    each($system_users) |$user| {
        rvm::system_user {
            $user:
        }
    }

    # Gemset
    rvm_gemset {
        "$gemset_name":
            ensure => present,
            require => Rvm_system_ruby[$ruby_version]
    }

    # Gems
    each($gems) |$package,$version| {
        rvm_gem {
            "$gemset_name/$package":
                ensure => $version,
                require => Rvm_gemset[$gemset_name];
        }
    }
}
