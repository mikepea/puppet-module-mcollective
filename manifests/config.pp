
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

