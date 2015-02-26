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
    reboot;
  EOH
end

