
class mcollective::plugin::package::ddl {
    mcollective::ddl_file { "agent/package.ddl": source => "agent/package/package.ddl" }
}

class mcollective::plugin::package {
    include mcollective::plugin::package::ddl 
    mcollective::plugin_file { "agent/package.rb": source => "agent/package/puppet-package.rb" }
}

class mcollective::plugin::package::client {
    include mcollective::plugin::package::ddl 
    mcollective::client_file { "mc-package": source => "agent/package/mc-package" }
}

