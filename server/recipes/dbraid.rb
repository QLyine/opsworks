%w{mdadm xfsprogs}.each do |pkg|
  package pkg do
    action :install
  end
end

target = "/dev/md0"
mountLocation = "/srv/data"

# Create data directory to mount RAID to
directory mountLocation do
  owner root
  group root
  mode 00755
  action :create
  not_if { FileTest.blockdev?(target) }
end

raidDevNumber = 4
devList = [ "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi" ]

execute "create raid" do
 command "yes |sudo mdadm --create #{target} --level=0 -c256 --raid-devices=#{raidDevNumber} #{devList.join(" ")}; mkfs.xfs #{target}"
 not_if { FileTest.blockdev?(target) }
end

# Mount the new filesystem
mount mountLocation do
  device target
  fstype "xfs"
  options "rw"
  action :mount
end

#script "create_md0" do 
#  interpreter "bash" 
#  user "root" 
#  code <<-EOH 
#    umount /disco{1,2,3,4} ; 
#    yes | sudo mdadm --create /dev/md0 --level=0 -c256 --raid-devices=4 /dev/xvd[ijlk] ;
#    echo 'DEVICE /dev/xvdk /dev/xvdl /dev/xvdj /dev/xvdi' | sudo tee /etc/mdadm/mdadm.conf ;
#    mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf ;
#    update-initramfs -u ;
#    sudo blockdev --setra 65536 /dev/md0;
#  EOH
#end
