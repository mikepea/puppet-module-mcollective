
class mcollective::service {

    case $operatingsystem {
        ubuntu,debian,redhat,centos: { include mcollective::service::actual }
        default: { notice("${hostname}: mcollective: module does not yet support $operatingsystem") }
    }
}

