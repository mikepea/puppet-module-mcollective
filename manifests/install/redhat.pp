
class mcollective::install::redhat {

    package { "stomp":
        provider => gem,
        #ensure => "1.1", # needed for Mcollective < 0.4.6
    }

    package { "mcollective":
        ensure => $mcollective_package_version ? {
            "" => present,
            default => $mcollective_package_version
        },
        require => Package["stomp"],
    }

}

