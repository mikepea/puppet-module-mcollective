
class mcollective::config::monit {

    # optional class to help monitor/control mcollective server status via monit

    @file { "/etc/monit.d/mcollectived.monitrc":
        tag => "monitrc",
        content => template("mcollective/monitrc.erb"),
        ensure => present,
        mode => 0644,
        owner => root,
        group => root,
    }

}

