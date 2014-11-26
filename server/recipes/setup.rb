if node["opsworks"]["instance"]["instance_type"] == "i2.xlarge" 
  
  target = "/dev/xvdb"
  mountLocation = "/srv/data/"

  directory mountLocation do
   #user  node[:app][:dockers_db][:volume_owner] 
   #group node[:app][:dockers_db][:volume_group]
   user 'root'
   owner 'root'
   mode 00700
   action :create
   #not_if { FileTest.blockdev?(target) }
  end

  execute "format parition" do
    command "sudo mkfs.ext4 #{target}"
  end 

  # Mount the new filesystem
  mount mountLocation do
    device target
    fstype "ext4"
    options "rw"
    action :mount
  end

end

