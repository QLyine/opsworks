require 'resolv'

template '/etc/hosts' do
  source "hosts.erb"
  mode "0644"
  variables(
    :localhost_name => node[:opsworks][:instance][:hostname],
    :registry_domain => node[:app][:domain],
    :registry_ip => node[:app][:ip],
    :nodes => search(:node, "name:*")
  )
end
