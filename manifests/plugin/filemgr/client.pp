
class mcollective::plugin::filemgr::client {
    mcollective::client_file { "mc-filemgr": source => "agent/filemgr/mc-filemgr" }
}

