
class mcollective::config::nagios {

    # optional class to help monitor mcollective server status via NRPE

    nagios::nrpe_command { "check_mcollective_touch":
        command   => "check_file_age",
        parameters => "-w 600 -c 1200 /var/run/mcollective.plugin.filemgr.touch",
        cplugdir  => 'system'
    }

    nagios::nrpe_command { "check_proc_mcollective":
        command   => "check_procs",
        parameters => "-c 1:5 -w 1:1 --argument-array=mcollective -C ruby",
        cplugdir  => 'system'
    }

}

