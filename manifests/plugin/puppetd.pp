
class mcollective::plugin::puppetd {
    mcollective::plugin_file { "agent/puppetd.rb": source => "agent/puppetd/puppetd.rb" }
}

