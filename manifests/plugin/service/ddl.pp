
class mcollective::plugin::service::ddl {
    mcollective::ddl_file { "agent/service.ddl": source => "agent/service/service.ddl" }
}

