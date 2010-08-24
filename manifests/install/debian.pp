
class mcollective::install::debian {

    package { "stomp":
        provider => gem,
        #ensure => "1.1",
    }

    package { "mcollective":
        ensure => $mcollective_package_version ? {
            "" => present,
            default => $mcollective_package_version
        },
        require => Package["stomp"],
    }

}
