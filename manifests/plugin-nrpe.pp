
class mcollective::plugin::nrpe::ddl {
    mcollective::ddl_file { "agent/nrpe.ddl": source => "agent/nrpe/nrpe.ddl" }
}

class mcollective::plugin::nrpe {
    include mcollective::plugin::nrpe::ddl 
    mcollective::plugin_file { "agent/nrpe.rb": source => "agent/nrpe/nrpe.rb" }
}

class mcollective::plugin::nrpe::client {
    include mcollective::plugin::nrpe::ddl 
    mcollective::client_file { "mc-nrpe": source => "agent/nrpe/mc-nrpe" }
}

