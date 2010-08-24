
class mcollective::install {
    case $operatingsystem {
        ubuntu,debian: { include mcollective::install::debian }
        redhat,centos: { include mcollective::install::redhat }
        default: { fail("${hostname}: mcollective: trying to install unsupported operatingsystem $operatingsystem") }
    }
}

