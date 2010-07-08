
class mcollective::plugin::process {
    case $mcollective_sys_proctable_package {
        "": { realize Package["sys-proctable"] }
        "none": { }
        default: { realize Package["${mcollective_sys_proctable_package}"] }
    }
    mcollective::plugin_file { "agent/process.rb": source => "agent/process/process.rb" }
}

class mcollective::plugin::process::client {
    mcollective::client_file { "mc-pgrep": source => "agent/process/mc-pgrep" }
}

