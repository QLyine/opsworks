include_recipe 'lvm::default'

lvm_volume_group 'vg00' do
  
  if node[:opsworks][:instance][:instance_type] == "c3.xlarge"
    physical_volumes ['/dev/xvdb', '/dev/xvdc']
  end 

  logical_volume 'swap' do
    size        '8G'
  end

  logical_volume 'dockerdata' do
    size        '100%FREE'
    filesystem  'ext4'
    mount_point '/mnt'
  end
end

