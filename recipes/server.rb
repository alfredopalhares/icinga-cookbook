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
    :allow_empty_hostgroup_assignment => node["icinga"]["allow_empty_hostgroup_assignment"],
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
    resources(:service => "icinga")
  )
end


include_recipe "apache2"

web_group = node["apache"]["group"]

if Chef::Config[:solo]
  Chef::Log.error("This recipe uses search. Chef Solo does not support search.")
else
  sysadmins = search(:users, "groups:#{node["icinga"]["users_databag_group"]}")
end

template "#{node["icinga"]["conf_dir"]}/htpasswd.users" do
  source "htpasswd.users.erb"
  owner "root"
  group web_group
  mode 00640
  variables(
    :sysadmins => sysadmins
  )
  notifies(
    :reload,
    resources(:service => "apache2")
  )
end

members = Array.new()
sysadmins.each do |sa|
  members.push(sa["id"])
end

template "#{node["icinga"]["object_dir"]}/contacts_icinga.cfg" do
  source "contacts.cfg.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :sysadmins => sysadmins,
    :members => members
  )
  notifies(
    :reload,
    resources(:service => "icinga")
  )
end

directory node["icinga"]["command_dir"] do
  owner "root"
  group "root"
  mode 00755
end

icinga_command "notify-host-by-email" do
  command "/usr/bin/printf \"%b\" \"***** Icinga *****\\n\\nNotification Type: $NOTIFICATIONTYPE$\\nHost: $HOSTNAME$\\nState: $HOSTSTATE$\\nAddress: $HOSTADDRESS$\\nInfo: $HOSTOUTPUT$\\n\\nDate/Time: $LONGDATETIME$\\n\" | /usr/bin/mail -s \"** $NOTIFICATIONTYPE$ Host Alert: $HOSTNAME$ is $HOSTSTATE$ **\" $CONTACTEMAIL$"
end

icinga_command "notify-service-by-email" do
  command "/usr/bin/printf \"%b\" \"***** Icinga *****\\n\\nNotification Type: $NOTIFICATIONTYPE$\\n\\nService: $SERVICEDESC$\\nHost: $HOSTALIAS$\\nAddress: $HOSTADDRESS$\\nState: $SERVICESTATE$\\n\\nDate/Time: $LONGDATETIME$\\n\\nAdditional Info:\\n\\n$SERVICEOUTPUT$\\n\" | /usr/bin/mail -s \"** $NOTIFICATIONTYPE$ Service Alert: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **\" $CONTACTEMAIL$"
end

icinga_command "process-host-perfdata" do
  command "/usr/bin/printf \"%b\" \"$LASTHOSTCHECK$\\t$HOSTNAME$\\t$HOSTSTATE$\\t$HOSTATTEMPT$\\t$HOSTSTATETYPE$\\t$HOSTEXECUTIONTIME$\\t$HOSTOUTPUT$\\t$HOSTPERFDATA$\\n\" >> /var/lib/icinga/host-perfdata.out"
end

icinga_command "process-service-perfdata" do
  command "/usr/bin/printf \"%b\" \"$LASTSERVICECHECK$\\t$HOSTNAME$\\t$SERVICEDESC$\\t$SERVICESTATE$\\t$SERVICEATTEMPT$\\t$SERVICESTATETYPE$\\t$SERVICEEXECUTIONTIME$\\t$SERVICELATENCY$\\t$SERVICEOUTPUT$\\t$SERVICEPERFDATA$\\n\" >> /var/lib/icinga/service-perfdata.out"
end

nodes = Array.new()
if Chef::Config[:solo]
  Chef::Log.error("This recipe uses search. Chef Solo does not support search.")
  nodes.push(node)
else
  search(:node, "name:*").each() do |n|
    nodes.push(n)
  end
end



# Server hostgroups
hostgroups = Array.new()

if Chef::Config[:solo]
  Chef::Log.fatal("You need to be able to search to fill the hostgroups")
else
  # Add roles to hostgroups
  search(:role, "*:*").each() do |r|
    group = Hash.new()
    group["name"] = r.name
    group["alias"] = r.description
    hostgroups.push(group)
  end
end

os_list = Array.new()
#Also add diferent OS
nodes.each() do |n|
  if !os_list.include?(n["os"])
    os_list.push(n["os"])
  end
end

os_list.each() do |os|
  group = Hash.new()
  group["name"] = os
  group["alias"] = os + " Operative System"
  hostgroups.push(group)
end

template "#{node["icinga"]["object_dir"]}/hostgroups_icinga.cfg" do
  source "hostgroups.cfg.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :hostgroups => hostgroups
  )
  notifies(
    :reload,
    resources(:service => "icinga")
  )
end

server_hostgroups = Array.new()

nodes.each() do |n|
  n["hostgroups"] = Array.new()
  if !n.run_list.roles.empty?
    n.run_list.roles.each() do |r|
      n["hostgroups"].push(r.name)
    end
  end
  n["hostgroups"].push(n["os"])

  if n["name"] == node["name"]
    n["hostgroups"].each() do |group|
      server_hostgroups.push(group)
    end
  end
end

template "#{node["icinga"]["object_dir"]}/hosts_icinga.cfg" do
  source "hosts.cfg.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :nodes => nodes
  )
  notifies(
    :reload,
    resources(:service => "icinga")
  )
end
