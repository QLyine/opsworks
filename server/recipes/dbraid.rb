mdadm "/dev/md0" do
  devices [ "/dev/xvdi", "/dev/xvdj", "/dev/xvdl", "/dev/xvdk" ]
  level 0
  action :create
end
