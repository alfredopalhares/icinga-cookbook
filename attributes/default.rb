default["icinga"]["conf_dir"] = "/etc/icinga"
default["icinga"]["nagios_plugins"] = "/etc/nagios-plugins/config"
default["icinga"]["object_dir"] = "#{node["icinga"]["conf_dir"]}/objects"
default["icinga"]["command_dir"] = "#{node["icinga"]["object_dir"]}/commands"
default["icinga"]["contacts_dir"] = "#{node["icinga"]["object_dir"]}/contacts"
default["icinga"]["hosts_dir"] = "#{node["icinga"]["object_dir"]}/hosts"
default["icinga"]["contactgroups_dir"] = "#{node["icinga"]["object_dir"]}/contactgroups"
default["icinga"]["module_dir"] = "#{node["icinga"]["conf_dir"]}/modules"

default["icinga"]["user"] = "nagios"
default["icinga"]["group"] = "nagios"

default["icinga"]["check_external_commands"] = 1
default["icinga"]["command_check_interval"] = -1

default["icinga"]["enable_notifications"] = 1
default["icinga"]["accept_passive_host_checks"] = 1

default["icinga"]["process_performance_data"] = 0
default["icinga"]["perfdata_file_mode"] = "a"
default["icinga"]["perfdata_file_processing_interval"] = 0

default["icinga"]["allow_empty_hostgroup_assignment"] = 1

default["icinga"]["obsess_over_services"] = 0
default["icinga"]["ocsp_command"] = "somecommand"
default["icinga"]["obsess_over_hosts"] = 0
default["icinga"]["ochp_command"] = "somecommand"

default["icinga"]["translate_passive_host_checks"] = 0
default["icinga"]["passive_host_checks_are_soft"] = 0

default["icinga"]["check_for_orphaned_services"] = 1
default["icinga"]["check_for_orphaned_hosts"] = 1

default["icinga"]["service_check_timeout_state"] = "u"
default["icinga"]["check_service_freshness"] = 1

default["icinga"]["service_freshness_check_interval"] = 60
default["icinga"]["check_host_freshness"] = 0
default["icinga"]["host_freshness_check_interval"] = 60
default["icinga"]["additional_freshness_latency"] = 15

default["icinga"]["enable_flap_detection"] = 1
default["icinga"]["low_service_flap_threshold"] = 5.0
default["icinga"]["high_service_flap_threshold"] = 20.0
default["icinga"]["low_host_flap_threshold"] = 5.0
default["icinga"]["high_host_flap_threshold"] = 20.0

default["icinga"]["date_format"] = "iso8601"

default["icinga"]["stalking_event_handlers_for_hosts"] = 0
default["icinga"]["stalking_event_handlers_for_services"] = 0
default["icinga"]["stalking_notifications_for_hosts"] = 0
default["icinga"]["stalking_notifications_for_services"] = 0

default["icinga"]["admin_email"] = "root@localhost"
default["icinga"]["admin_pager"] = "pageroot@localhost"

default["icinga"]["enable_environment_macros"] = 1
