
class mcollective::plugin::puppetd {
    mcollective::plugin_file { "agent/puppetd.rb": source => "agent/puppetd/puppetd.rb" }
}

class mcollective::plugin::puppetd::client {
    mcollective::client_file { "agent/mc-puppetd": source => "agent/puppetd/mc-puppetd" }
}

