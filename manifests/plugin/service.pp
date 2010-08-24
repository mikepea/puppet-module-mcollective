
class mcollective::plugin::service {
    include mcollective::plugin::service::ddl 
    mcollective::plugin_file { "agent/service.rb": source => "agent/service/puppet-service.rb" }
}

