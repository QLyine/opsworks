ssd = node['eio']['ssd']
mode = node['eio']['mode']
policy = node['eio']['reppolicy']
name = node['eio']['name']
bsize = node['eio']['bsize']
hdd = node['eio']['hdd']

execute "install_eio" do 
  command <<-EOH 
    eio_cli create -d #{hdd} -s #{ssd} -p #{policy} -m #{mode} -b #{bsize} -c #{name}
  EOH
  only_if { FileTest.blockdev?(ssd) && FileTest.blockdev?(hdd) && !FileTest.exists?("/proc/enhanceio/" + name) }
end

