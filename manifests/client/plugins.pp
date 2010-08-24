
class mcollective::client::plugins {
    include mcollective::plugin::filemgr::client
    include mcollective::plugin::iptables::client
    include mcollective::plugin::nrpe::client
    include mcollective::plugin::package::client
    include mcollective::plugin::process::client
    include mcollective::plugin::puppetd::client
    include mcollective::plugin::service::client
}

