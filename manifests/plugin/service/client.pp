
class mcollective::plugin::service::client {
    include mcollective::plugin::service::ddl 
    mcollective::client_file { "mc-service": source => "agent/service/mc-service" }
}

