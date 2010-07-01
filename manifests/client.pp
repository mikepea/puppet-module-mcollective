
class mcollective::client {
    tag("autoapply")
    case $operatingsystem {
        ubuntu,debian,redhat,centos: { include mcollective::client::actual }
        default: { notice("${hostname}: mcollective: module does not yet support $operatingsystem") }
    }
}

class mcollective::client::actual {
    include mcollective::client::install
    include mcollective::client::plugins
    include mcollective::client::config
}

class mcollective::client::install {
    package { "mcollective-client": ensure => present }
}

class mcollective::client::config {
    file { "/etc/mcollective/client.cfg": 
        content => template("mcollective/client.cfg.erb"),
        mode    => 0440,
        owner   => root,
        group   => $mcollective_client_group ? {
            "" => "root",
            default => $mcollective_client_group
        },
        require => Class["mcollective::client::install"],
    }
}

class mcollective::client::plugins {
    include mcollective::plugin::filemgr::client
    include mcollective::plugin::iptables::client
    include mcollective::plugin::nrpe::client
    include mcollective::plugin::package::client
    include mcollective::plugin::process::client
    include mcollective::plugin::puppetd::client
    include mcollective::plugin::service::client
}

