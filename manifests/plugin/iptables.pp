

class mcollective::plugin::iptables {
    include mcollective::plugin::iptables::ddl 
    mcollective::plugin_file { "agent/iptables.rb": source => "agent/iptables-junkfilter/iptables.rb" }
}

