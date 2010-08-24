

class mcollective::plugin::nrpe::client {
    include mcollective::plugin::nrpe::ddl 
    mcollective::client_file { "mc-nrpe": source => "agent/nrpe/mc-nrpe" }
}

