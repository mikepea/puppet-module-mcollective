
class mcollective::plugin::iptables::client {
    include mcollective::plugin::iptables::ddl 
    mcollective::client_file { "mc-iptables": source => "agent/iptables-junkfilter/mc-iptables" }
}

