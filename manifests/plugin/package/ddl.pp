
class mcollective::plugin::package::ddl {
    mcollective::ddl_file { "agent/package.ddl": source => "agent/package/package.ddl" }
}
