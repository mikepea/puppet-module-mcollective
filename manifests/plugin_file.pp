
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
