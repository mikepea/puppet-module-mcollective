
class mcollective::plugin::service {
    include mcollective::plugin::service::ddl 
    mcollective::plugin_file { "agent/service.rb": source => "agent/service/puppet-service.rb" }
}

class mcollective::plugin::service::ddl {
    mcollective::ddl_file { "agent/service.ddl": source => "agent/service/service.ddl" }
}

class mcollective::plugin::service::client {
    include mcollective::plugin::service::ddl 
    mcollective::client_file { "mc-service": source => "agent/service/mc-service" }
}

