%w{mdadm xfsprogs}.each do |pkg|
  package pkg do
    action :install
  end
end

target = "/dev/md0"
mountLocation = "/srv/data"

# Create data directory to mount RAID to
directory mountLocation do
  owner 'root'
  group 'root'
  mode 00755
  action :create
  not_if { FileTest.blockdev?(target) }
end

raidDevNumber = 4
devList = [ "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi" ]

execute "create raid" do
 command <<-EOH
   yes |sudo mdadm --create #{target} --level=0 -c256 --raid-devices=#{raidDevNumber} #{devList.join(" ")};
   TYPE=`blkid -o value -s TYPE #{target}`;
   [[ -z $TYPE ]] && mkfs.xfs #{target}
 EOH
 not_if { FileTest.blockdev?(target) }
end

# Mount the new filesystem
mount mountLocation do
  device target
  fstype "xfs"
  options "rw"
  action :mount
end

