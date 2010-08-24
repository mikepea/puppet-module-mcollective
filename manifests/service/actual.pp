
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
