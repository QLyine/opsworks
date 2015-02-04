include_recipe 'lvm::default'

# Calculate swap size
if node['swap_tuning']['size'].nil?
  node.default['swap_tuning']['size'] =
    Chef::SwapTuning.recommended_size_mb(node['memory']['total'])
  if !node['swap_tuning']['minimum_size'].nil? &&
     node['swap_tuning']['size'] < node['swap_tuning']['minimum_size']
    node.default['swap_tuning']['size'] = node['swap_tuning']['minimum_size']
  end
end


lvm_volume_group 'vg00' do
  
  if node[:opsworks][:instance][:instance_type] == "c3.xlarge"
    physical_volumes ['/dev/xvdb', '/dev/xvdc']
  end 

  logical_volume 'swap' do
    size         node.default['swap_tuning']['size'].to_s
  end

  logical_volume 'dockerdata' do
    size        '100%FREE'
    filesystem  'ext4'
    mount_point '/mnt'
  end
end

