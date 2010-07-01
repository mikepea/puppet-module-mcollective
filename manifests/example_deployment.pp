
# Use this class as a base, *in another module* to deploy the actual service,
#  with the various variables set for your environment
#
# Then do
#   include my_site::deployments::general::mcollective in your node or higher level class
#
# This is an example only. Call the class whatever you like.
#
class my_site::deployments::general::mcollective {

    $mcollective_psk            = create_and_print_password("mcollective-psk")
    $mcollective_stomp_user     = "mcollective"
    $mcollective_stomp_password = create_and_print_password("activemq-general-mcollective-password")
    $mcollective_stomp_host     = "stomp.example.com"
    $mcollective_stomp_port     = "61613"
    $mcollective_factsource     = "facter"

    include mcollective::service

    # Include the plugins you want - alternatively, put these in your 
    # own (eg) puppet, nrpe, etc modules.
    include mcollective::plugin::facter
    include mcollective::plugin::service
    include mcollective::plugin::package
    include mcollective::plugin::nrpe
    include mcollective::plugin::iptables
    include mcollective::plugin::puppetd
    include mcollective::plugin::filemgr
    include mcollective::plugin::process

}

