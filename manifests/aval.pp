exec { "apt-update":
	command => "/usr/bin/apt-get update"
}
package { ["apache2","mysql-server","unzip","vim"]:
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

service { "mysql-server":
	ensure => running,
	enable => true,
	hasrestart => true,
	require => Package["mysql-server"]
}

