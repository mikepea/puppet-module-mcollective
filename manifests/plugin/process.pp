
class mcollective::plugin::process {
    realize Package["sys-proctable"] # for process agent
    mcollective::plugin_file { "agent/process.rb": source => "agent/process/process.rb" }
}

