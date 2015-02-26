it = node[:opsworks][:instance][:instance_type]

# Default Doceker Opts
default['docker']['opts'] = nil 

unless node[:opsworks][:instance][:hostname].start_with?("awsdb") || node[:opsworks][:instance][:hostname].start_with?("analyticsdbmaster") 
  case it
  when "m3.large", "m3.xlarge", "c3.large", "c3.xlarge"
    default['docker']['opts'] = '-g /mnt/dockerdata'
  end
end
