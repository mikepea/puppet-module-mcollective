
class mcollective::virtual_resources::sys_proctable {
    @package { "sys-proctable":
            provider => "gem",
            ensure => present,
    }
}

