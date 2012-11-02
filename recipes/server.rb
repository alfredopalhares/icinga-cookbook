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
