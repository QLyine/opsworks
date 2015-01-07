if node[:opsworks][:instance][:instance_type] == "m3.large" 
  default['docker']['opts'] = '-g /mnt/dockerdata'
else
  default['docker']['opts'] = nil
end
