
class mcollective::plugin::puppetd::client {
    mcollective::client_file { "mc-puppetd": source => "agent/puppetd/mc-puppetd" }
}

