
class gpg_profile()
{

	package {'gnupg2': ensure=>"installed"}

	 exec { 'import gpg key for rvm':
	    subscribe => [ Package["gnupg2"]],
	    command     => 'curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -',
	    path        => $::path,
	    environment => 'HOME=/root',
	    before      => Exec['system-rvm'],
	    unless      => 'gpg2 --list-keys D39DC0E3',
	}
}

