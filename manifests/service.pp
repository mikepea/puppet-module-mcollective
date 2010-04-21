
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
    include mcollective::plugins

    service { "mcollective":
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        require => Class["mcollective::install"],
    }

}

class mcollective::config {

    File { 
        owner => root,
        group => root,
        mode  => 0440,
        require => Class["mcollective::install"]
    }

    Dir {
        owner => root,
        group => root,
        mode  => 0750,
        require => Class["mcollective::install"]
    }
    
    dir { "/etc/mcollective": }
    file { "/etc/mcollective/server.cfg": 
        content => template("mcollective/server.cfg.erb"),
        notify  => Service["mcollective"]
    }
    file { "/etc/mcollective/facts.yaml": 
        content => template("mcollective/facts.yaml.erb") 
    }
    
}

class mcollective::plugins {

    $p_base = "/usr/share/mcollective/plugins/mcollective"
    $s_base = "puppet://$fileserver/mcollective/plugins"

    File { 
        owner => root,
        group => root,
        mode  => 0444,
        require => Class["mcollective::install"],
        notify => Service["mcollective"],
    }

    file { "${p_base}/facts/facter.rb": source => "${s_base}/facts/facter/facter.rb" }
    file { "${p_base}/agent/puppet-service.rb": source => "${s_base}/agent/service/puppet-service.rb" }
    file { "${p_base}/agent/puppet-package.rb": source => "${s_base}/agent/package/puppet-package.rb" }
    file { "${p_base}/agent/nrpe.rb": source => "${s_base}/agent/nrpe/nrpe.rb" }
    file { "${p_base}/agent/puppetd.rb": source => "${s_base}/agent/puppetd/puppetd.rb" }

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
        ensure => "1.1",
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
