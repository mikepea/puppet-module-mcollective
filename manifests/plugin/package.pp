

class mcollective::plugin::package {
    include mcollective::plugin::package::ddl 
    mcollective::plugin_file { "agent/package.rb": source => "agent/package/puppet-package.rb" }
}

