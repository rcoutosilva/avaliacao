exec { "apt-update":
	command => "/usr/bin/apt-get update"
}
package { ["apache2","libapache2-mod-wsgi","unzip","vim","python-virtualenv","python3","python3-pip","python3-dev"]:
	ensure => installed,
	require => Exec["apt-update"]
}

service { "apache2":
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
        require => Package["apache2"]
}


