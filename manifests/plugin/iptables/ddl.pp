
class mcollective::plugin::iptables::ddl {
    mcollective::ddl_file { "agent/iptables.ddl": source => "agent/iptables-junkfilter/iptables.ddl" }
}
