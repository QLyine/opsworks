it = node[:opsworks][:instance][:instance_type]

default['physical_volumes'] = ['/dev/xvdb']

case it
when "c3.xlarge", "m3.xlarge"
  default['physical_volumes'] += ['/dev/xvdc']
end
