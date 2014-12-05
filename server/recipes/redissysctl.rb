directory "/etc/sysctl.d" do
  mode 0755
  owner "root"
  group "root"
  action :create
end

template "/etc/sysctl.d/99-redis.conf" do
  mode 0644
  owner "root"
  group "root"
  source "sysctl.conf.erb"
  cookbook "server"
end


node[:redis][:sysctl].each do |systcl, value|
  execute "Setting sysctl: #{systcl}" do
    command "sysctl -w #{systcl}=#{value}"
    action :run
  end
end
