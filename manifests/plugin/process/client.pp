
class mcollective::plugin::process::client {
    mcollective::client_file { "mc-pgrep": source => "agent/process/mc-pgrep" }
}

