

class mcollective {

    include mcollective::install

}

class mcollective::install {
    case $operatingsystem {
        ubuntu,debian: { include mcollective::install::debian }
        default: { fail("mcollective: does not yet support $operatingsystem") }
    }
}

class mcollective::install::debian {

    package { "mcollective": ensure => present }

}
