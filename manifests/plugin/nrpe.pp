

class mcollective::plugin::nrpe {
    include mcollective::plugin::nrpe::ddl 
    mcollective::plugin_file { "agent/nrpe.rb": source => "agent/nrpe/nrpe.rb" }
}
