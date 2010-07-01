
define mcollective::plugin_file ( $source ) {

    File { 
        owner => root,
        group => root,
        mode  => 0555,
        require => Class["mcollective::client::install"],
    }

    $bin_dir = "/usr/local/bin"
    $s_base = "puppet://$fileserver/mcollective/plugins"

    file { "${p_base}/${title}": source => "${s_base}/${source}" }

}

define mcollective::ddl_file ( $source ) {

    case $operatingsystem {
        debian,ubuntu: { $p_base = "/usr/share/mcollective/plugins/mcollective" }
        redhat,centos: { $p_base = "/usr/libexec/mcollective/mcollective" }
    }
    $s_base = "puppet://$fileserver/mcollective/plugins"

    File {
        owner => root,
        group => root,
        mode  => 0444,
        require => Class["mcollective::install"],
    }

    file { "${p_base}/${title}": source => "${s_base}/${source}" }

}

define mcollective::plugin_file ( $source ) {

    case $operatingsystem {
        debian,ubuntu: { $p_base = "/usr/share/mcollective/plugins/mcollective" }
        redhat,centos: { $p_base = "/usr/libexec/mcollective/mcollective" }
    }
    $s_base = "puppet://$fileserver/mcollective/plugins"

    File {
        owner => root,
        group => root,
        mode  => 0444,
        require => Class["mcollective::install"],
        notify => Service["mcollective"],
    }

    file { "${p_base}/${title}": source => "${s_base}/${source}" }

}

class mcollective::plugins {
    # optional class to include commonly used plugins
    #  -  include this in your site_mcollective module, or 
    #  -  include the classes in your (eg) site_puppet module on an as-needed basis or

    include mcollective::plugin::facter
    include mcollective::plugin::service
    include mcollective::plugin::package
    include mcollective::plugin::nrpe
    include mcollective::plugin::iptables
    include mcollective::plugin::puppetd
    include mcollective::plugin::filemgr
    include mcollective::plugin::process

}

