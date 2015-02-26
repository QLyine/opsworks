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


if node[:opsworks][:instance][:hostname].start_with?("awsdb") || node[:opsworks][:instance][:hostname].start_with?("analyticsdbmaster")

  lvm_volume_group 'vg00' do

    physical_volumes node['physical_volumes']
    swapsize = node.default['swap_tuning']['size'] 
    # If we are on database node we want more space for cache than swap
    swapsize = swapsize / 4

    logical_volume 'swap' do
      size         swapsize.to_s
    end

    # SSD cache fof HDD
    logical_volume 'cachelvm' do
      size        '100%FREE'
    end

  end

else

  lvm_volume_group 'vg00' do

    logical_volume 'swap' do
      size         node.default['swap_tuning']['size'].to_s
    end

    logical_volume 'dockerdata' do
      size        '100%FREE'
      filesystem  'ext4'
      mount_point '/mnt'
    end

  end

end


