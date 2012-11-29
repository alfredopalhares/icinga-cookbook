action :add do
  Chef::Log.info("Creating #{new_resource.contactgroup_name} contact in #{node["icinga"]["contactgroups_dir"]}")

  contents = Hash.new()
  contents["contactgroup_name"] = new_resource.contactgroup_name
  contents["alias"] = new_resource.contactgroup_alias

  if !new_resource.members.nil?()
    contents["members"] = new_resource.members
  end
  if !new_resource.contactgroup_members.nil?()
    contents["contactgroup_members"] = new_resource.contactgroup_members
  end

  file "#{node["icinga"]["contactgroups_dir"]}/#{new_resource.contactgroup_name}.cfg" do
    owner node["icinga"]["user"]
    group node["icinga"]["group"]
    mode 00644
    content definition_to_s("contactgroup", contents)
    notifies(
      :reload,
      resources(:service => "icinga")
    )
  end
  new_resource.updated_by_last_action(true)
end

action :remove do
  if ::File.exists?("#{node["icinga"]["contactgroups_dir"]}/#{new_resource.contactgroup_name}.cfg" )
    Chef::Log.info("Deleting #{new_resource.contactgroup_name} command from #{node["icinga"]["contactgroupss_dir"]})")
    file "#{node["icinga"]["contacts_dir"]}/#{new_resource.contactgroup_name}.cfg" do
      notifies(
        :reload,
        resources(:service => "icinga")
      )
      action :delete
    end
    new_resource.updated_by_last_action(true)
  end
end
