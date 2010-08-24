
class mcollective::plugins {
    # optional class to include commonly used plugins
    #  -  include this in your site_mcollective module, or 
    #  -  include the classes in your (eg) site_puppet module on an as-needed basis or

    include mcollective::plugin::facter
    include mcollective::plugin::service
    include mcollective::plugin::package
    include mcollective::plugin::nrpe
    include mcollective::plugin::iptables
    include mcollective::plugin::puppetd
    include mcollective::plugin::filemgr
    include mcollective::plugin::process

}

