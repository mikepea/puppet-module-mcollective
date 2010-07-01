
class mcollective::plugin::process {
    realize Package["sys-proctable"] # for process agent
    mcollective::plugin_file { "agent/process.rb": source => "agent/process/process.rb" }
}

class mcollective::plugin::process::client {
    mcollective::client_file { "agent/mc-pgrep": source => "agent/process/mc-pgrep" }
}

