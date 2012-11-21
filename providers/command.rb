action :add do
  Chef::Log.info("Creating #{new_resource.command_name} command in #{node["icinga"]["command_dir"]}")
  contents = "define command{\n"
  contents += "  command_name #{new_resource.command_name}\n"
  contents += "  command_line #{new_resource.command}\n"
  contents += "}"
  file "#{node["icinga"]["command_dir"]}/#{new_resource.command_name}.cfg" do
    owner node["icinga"]["user"]
    group node["icinga"]["group"]
    mode 00644
    content contents
    notifies(
      :reload,
      resources(:service => "icinga")
    )
  end
end

action :remove do
  if ::File.exists?("#{node["icinga"]["command_dir"]}/#{new_resource.command_name}.cfg" )
    Chef::Log.info("Deleting #{new_resource.command_name} command from #{node["icinga"]["command_dir"]})")
    file "#{node["icinga"]["command_dir"]}/#{new_resource.command_name}.cfg" do
      notifies(
        :reload,
        resources(:service => "icinga")
      )
      action :delete
    end
  end
end
