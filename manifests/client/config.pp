
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

