
class mcollective::plugin::filemgr {
    mcollective::plugin_file { "filemgr.rb": source => "agent/filemgr/filemgr.rb" }
}

class mcollective::plugin::filemgr::client {
    mcollective::client_file { "mc-filemgr": source => "agent/filemgr/mc-filemgr" }
}

