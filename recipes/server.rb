package "icinga" do
  action :install
end

service "icinga" do
  supports(
    :start => true,
    :stop => true,
    :restart => true,
    :status => true,
    :reload => true
  )
  action [:enable, :start]
end

template "#{node["icinga"]["conf_dir"]}/icinga.cfg" do
  source "icinga.cfg.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :conf_dir => node["icinga"]["conf_dir"],
    :nagios_plugins => node["icinga"]["nagios_plugins"],
    :object_dir => node["icinga"]["object_dir"],
    :module_dir => node["icinga"]["module_dir"],
    :user => node["icinga"]["user"],
    :group => node["icinga"]["group"] || node["icinga"]["user"],
    :check_external_commands => node["icinga"]["check_external_commands"],
    :command_check_interval => node["icinga"]["command_check_interval"],
    :enable_notifications => node["icinga"]["enable_notifications"],
    :accept_passive_host_checks => node["icinga"]["accept_passive_host_checks"],
    :process_performance_data => node["icinga"]["process_performance_data"],
    :perfdata_file_mode => node["icinga"]["perfdata_file_mode"],
    :perfdata_file_processing_interval => node["icinga"]["perfdata_file_processing_interval"],
    :obsess_over_services => node["icinga"]["obsess_over_services"],
    :ocsp_command => node["icinga"]["ocsp_command"],
    :obsess_over_hosts => node["icinga"]["obsess_over_hosts"],
    :ochp_command => node["icinga"]["ochp_command"],
    :translate_passive_host_checks => node["icinga"]["translate_passive_host_checks"],
    :passive_host_checks_are_soft => node["icinga"]["passive_host_checks_are_soft"],
    :check_for_orphaned_services => node["icinga"]["check_for_orphaned_services"],
    :check_for_orphaned_hosts => node["icinga"]["check_for_orphaned_hosts"],
    :service_check_timeout_state => node["icinga"]["service_check_timeout_state"],
    :check_service_freshness => node["icinga"]["check_service_freshness"],
    :service_freshness_check_interval => node["icinga"]["service_freshness_check_interval"],
    :check_host_freshness => node["icinga"]["check_host_freshness"],
    :host_freshness_check_interval => node["icinga"]["host_freshness_check_interval"],
    :additional_freshness_latency => node["icinga"]["additional_freshness_latency"],
    :enable_flap_detection => node["icinga"]["enable_flap_detection"],
    :low_service_flap_threshold => node["icinga"]["low_service_flap_threshold"],
    :high_service_flap_threshold => node["icinga"]["high_service_flap_threshold"],
    :low_host_flap_threshold => node["icinga"]["low_host_flap_threshold"],
    :high_host_flap_threshold => node["icinga"]["high_host_flap_threshold"],
    :date_format => node["icinga"]["date_format"],
    :stalking_event_handlers_for_hosts => node["icinga"]["stalking_event_handlers_for_hosts"],
    :stalking_event_handlers_for_services => node["icinga"]["stalking_event_handlers_for_services"],
    :stalking_notifications_for_hosts => node["icinga"]["stalking_notifications_for_hosts"],
    :stalking_notifications_for_services => node["icinga"]["stalking_notifications_for_services"],
    :admin_email => node["icinga"]["admin_email"],
    :admin_pager => node["icinga"]["admin_pager"],
    :enable_environment_macros => node["icinga"]["enable_environment_macros"]
  )
  notifies(
    :reload,
    resources(:service => "icinga"),
    :immediately
  )
end
