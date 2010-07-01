
class mcollective::service {

    tag("autoapply")

    case $operatingsystem {
        ubuntu,debian,redhat,centos: { include mcollective::service::actual }
        default: { notice("${hostname}: mcollective: module does not yet support $operatingsystem") }
    }
}

class mcollective::service::actual {

    include mcollective::install
    include mcollective::config

    service { "mcollective":
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        require => Class["mcollective::install"],
    }

}

class mcollective::config {

    case $operatingsystem {
        debian,ubuntu: { $libdir = "/usr/share/mcollective/plugins" }
        redhat,centos: { $libdir = "/usr/libexec/mcollective" }
    }

    File {
        owner => root,
        group => root,
        mode  => 0440,
        require => Class["mcollective::install"]
    }

    file { "/etc/mcollective": 
        ensure => directory,
        mode  => 0755,
    }
    file { "/etc/mcollective/server.cfg":
        content => template("mcollective/server.cfg.erb"),
        notify  => Service["mcollective"]
    }
    file { "/etc/mcollective/facts.yaml":
        content => template("mcollective/facts.yaml.erb")
    }

}

class mcollective::config::nagios {

    # optional class to help monitor mcollective server status via NRPE

    @file { "/etc/nagios/nrpe_conf.d/mcollective_touch_check.cfg":
        tag => "nagios_nrpe_check",
        ensure => absent,
    }

    @nagios::nrpe_command { "check_mcollective_touch":
        command   => "check_file_age",
        parameters => "-w 600 -c 1200 /var/run/mcollective.plugin.filemgr.touch",
        cplugdir  => 'system'
    }

}

class mcollective::install {
    case $operatingsystem {
        ubuntu,debian: { include mcollective::install::debian }
        redhat,centos: { include mcollective::install::redhat }
        default: { fail("${hostname}: mcollective: trying to install unsupported operatingsystem $operatingsystem") }
    }
}

class mcollective::install::redhat {

    package { "stomp":
        provider => gem,
        #ensure => "1.1", # needed for Mcollective < 0.4.6
    }

    package { "mcollective":
        ensure => present,
        require => Package["stomp"],
    }

}

class mcollective::install::debian {

    package { "stomp":
        provider => gem,
        ensure => "1.1",
    }

    package { "mcollective":
        ensure => present,
        require => Package["stomp"],
    }

}
