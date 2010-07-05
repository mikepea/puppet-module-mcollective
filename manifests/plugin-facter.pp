
class mcollective::plugin::facter {
    mcollective::plugin_file { "facts/facter.rb": source => "facts/facter/facter.rb" }
}

