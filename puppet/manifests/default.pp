Exec { 
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] 
}
include apt_packages_profile
include gpg_profile
include ruby
include nodejs_profile
include java