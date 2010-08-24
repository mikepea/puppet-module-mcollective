
class mcollective::plugin::puppetca::ddl {
    mcollective::ddl_file { "agent/puppetca.ddl": source => "agent/puppetca/puppetca.ddl" }
}
