if node[:opsworks][:instance][:instance_type] == "m3.large" && !node[:opsworks][:instance][:hostname].start_with?("awsdb") 
  default['docker']['opts'] = '-g /mnt/dockerdata'
else
  default['docker']['opts'] = nil
end
