action :add do
  Chef::Log.info("Creating #{new_resource.contact_name} contact in #{node["icinga"]["contacts_dir"]}")

  contents = Hash.new()
  contents["contact_name"] = new_resource.contact_name
  if !new_resource.contact_alias.nil?()
  contents["alias"] = new_resource.contact_alias
  end

  if !new_resource.contactgroups.nil?()
    contents["contactgroups"] = new_resource.contactgroups
  end

  contents["host_notifications_enabled"] = icinga_boolean(new_resource.host_notifications_enabled)
  contents["service_notifications_enabled"] = icinga_boolean(new_resource.service_notifications_enabled)
  contents["host_notification_period"] = new_resource.host_notification_period
  contents["service_notification_period"] = new_resource.service_notification_period
  contents["host_notification_commands"] = new_resource.host_notification_commands
  contents["service_notification_commands"] = new_resource.service_notification_commands

  if !new_resource.email.nil?()
    contents["email"] = new_resource.email
  end
  if !new_resource.pager.nil?()
    contents["pager"] = new_resource.pager
  end

  if !new_resource.addresses.nil?()
    address_num = 1
    new_resource.addresses.each do |address|
      key = "address" + address_num
      contects[key] = address
    end
  end

  if !new_resource.can_submit_commands.nil?()
    contents["can_submit_commands"] = icinga_boolean(new_resource.can_submit_commands)
  end
  if !new_resource.retain_status_information.nil?()
    contents["retain_status_information"] = icinga_boolean(new_resource.can_status_information)
  end
  if !new_resource.retain_nonstatus_information.nil?()
    contents["retain_nonstatus_information"] = icinga_boolean(new_resource.can_status_information)
  end

  file "#{node["icinga"]["contacts_dir"]}/#{new_resource.contact_name}.cfg" do
    owner node["icinga"]["user"]
    group node["icinga"]["group"]
    mode 00644
    content definition_to_s("contact", contents)
    notifies(
      :reload,
      resources(:service => "icinga")
    )
  end
  new_resource.updated_by_last_action(true)
end

action :remove do
  if ::File.exists?("#{node["icinga"]["contacts_dir"]}/#{new_resource.contact_name}.cfg" )
    Chef::Log.info("Deleting #{new_resource.contact_name} command from #{node["icinga"]["contacts_dir"]})")
    file "#{node["icinga"]["contacts_dir"]}/#{new_resource.contact_name}.cfg" do
      notifies(
        :reload,
        resources(:service => "icinga")
      )
      action :delete
    end
    new_resource.updated_by_last_action(true)
  end
end
