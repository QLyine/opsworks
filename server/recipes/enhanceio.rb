include_recipe 'chef-reboot::default'

reboot "now" do
  action :nothing
  reason "Cannot continue Chef run without a reboot."
  delay_mins 1
end


%w{build-essential dkms lvm2 git}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "install_eio" do 
  command <<-EOH 
    cd /root ;
    git clone https://github.com/stec-inc/EnhanceIO.git ;
    cd EnhanceIO/Driver/enhanceio/;
    make && make install ;
    cd ../../CLI/;
    cp eio_cli /sbin/ ;
    cp eio_cli.8 /usr/share/man/man8 ;
  EOH
  notifies :reboot_now, 'reboot[now]', :immediately
end

