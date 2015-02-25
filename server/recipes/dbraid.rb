%w{mdadm}.each do |pkg|
  package pkg do
    action :install
  end
end

script "create_md0" do 
  interpreter "bash" 
  user "root" 
  code <<-EOH 
    umount /disco{1,2,3,4} ; 
    yes | sudo mdadm --create /dev/md0 --level=0 -c256 --raid-devices=4 /dev/xvd[ijlk] ;
    echo 'DEVICE /dev/xvdk /dev/xvdl /dev/xvdj /dev/xvdi' | sudo tee /etc/mdadm/mdadm.conf ;
    mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf ;
    update-initramfs -u ;
    sudo blockdev --setra 65536 /dev/md0;
  EOH
end
