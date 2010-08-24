
class mcollective::plugin::package::client {
    include mcollective::plugin::package::ddl 
    mcollective::client_file { "mc-package": source => "agent/package/mc-package" }
}

