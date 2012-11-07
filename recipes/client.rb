package "nagios-nrpe-server" do
  action :install
end

service "nagios-nrpe-server" do
  supports(
    :start => true,
    :stop => true,
    :restart => true,
    :reload => true
  )
  action [:enable, :start]
end

template "#{node["icinga"]["nrpe"]["conf_dir"]}/nrpe.cfg" do
  source "nrpe.cfg.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :pidfile => node["icinga"]["nrpe"]["pidfile"],
    :port => node["icinga"]["nrpe"]["port"],
    :user => node["icinga"]["user"],
    :group => node["icinga"]["group"] || node["icinga"]["group"],
    :allowed_hosts => node["icinga"]["nrpe"]["allowed_hosts"].join(","),
    :dont_blame_nrpe => node["icinga"]["nrpe"]["dont_blame_nrpe"],
    :command_timeout => node["icinga"]["nrpe"]["command_timeout"],
    :connection_timeout => node["icinga"]["nrpe"]["connection_timeout"],
    :nagios_plugins => node["icinga"]["nrpe"]["nagios_plugins"],
    :conf_dir => node["icinga"]["nrpe"]["conf_dir"]
  )
  notifies(
    :reload,
    resources(:service => "nagios-nrpe-server"),
    :immediately
  )
end
