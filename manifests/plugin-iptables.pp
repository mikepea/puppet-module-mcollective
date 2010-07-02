
class mcollective::plugin::iptables::ddl {
    mcollective::ddl_file { "agent/iptables.ddl": source => "agent/iptables-junkfilter/iptables.ddl" }
}

class mcollective::plugin::iptables {
    include mcollective::plugin::iptables::ddl 
    mcollective::plugin_file { "agent/iptables.rb": source => "agent/iptables-junkfilter/iptables.rb" }
}

class mcollective::plugin::iptables::client {
    include mcollective::plugin::iptables::ddl 
    mcollective::client_file { "mc-iptables": source => "agent/iptables-junkfilter/mc-iptables" }
}

