
class mcollective::plugin::nrpe::ddl {
    mcollective::ddl_file { "agent/nrpe.ddl": source => "agent/nrpe/nrpe.ddl" }
}
