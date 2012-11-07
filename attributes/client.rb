default["icinga"]["nrpe"]["conf_dir"] = "/etc/nagios"

default["icinga"]["nrpe"]["pidfile"] = "/var/run/nagios/nrpe.pid"
default["icinga"]["nrpe"]["port"] = 5666
default["icinga"]["nrpe"]["allowed_hosts"] = ["127.0.0.1"]
default["icinga"]["nrpe"]["dont_blame_nrpe"] = 0
default["icinga"]["nrpe"]["command_timeout"] = 60
default["icinga"]["nrpe"]["connection_timeout"] = 360
default["icinga"]["nrpe"]["nagios_plugins"] = "/usr/lib/nagios/plugins"
