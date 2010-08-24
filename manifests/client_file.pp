
define mcollective::client_file ( $source, $prefix = "/usr/local" ) {

    File { 
        owner => root,
        group => root,
        mode  => 0555,
        require => Class["mcollective::client::install"],
    }

    $s_base = "puppet://$fileserver/mcollective/plugins"

    file { "${prefix}/bin/${title}": source => "${s_base}/${source}" }

}

