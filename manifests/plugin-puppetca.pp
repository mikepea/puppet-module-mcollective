
class mcollective::plugin::puppetca::ddl {
    mcollective::ddl_file { "agent/puppetca.ddl": source => "agent/puppetca/puppetca.ddl" }
}

class mcollective::plugin::puppetca {
    include mcollective::plugin::puppetca::ddl 
    mcollective::plugin_file { "agent/puppetca.rb": source => "agent/puppetca/puppetca.rb" }
}


