
class mcollective::plugin::facter {
    mcollective::plugin_file { "facts/facts.rb": source => "facts/facter/facter.rb" }
}

