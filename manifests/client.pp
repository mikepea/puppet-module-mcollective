
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
}

class mcollective::client::install {
    package { "mcollective-client": ensure => present }
}

class mcollective::client::plugins {

    $bin_dir = "/usr/local/bin"
    $s_base = "puppet://$fileserver/mcollective/plugins"

    File { 
        owner => root,
        group => root,
        mode  => 0555,
        require => Class["mcollective::client::install"],
    }

    file { "${bin_dir}/mc-service": source => "${s_base}/agent/service/mc-service" }
    file { "${bin_dir}/mc-package": source => "${s_base}/agent/package/mc-package" }
    file { "${bin_dir}/mc-nrpe":    source => "${s_base}/agent/nrpe/mc-nrpe" }
    file { "${bin_dir}/mc-puppetd": source => "${s_base}/agent/puppetd/mc-puppetd" }

}

