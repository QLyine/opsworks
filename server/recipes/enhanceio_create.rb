ssd = default['eio']['ssd']
hhd = default['eio']['hdd']
mode = default['eio']['mode']
policy = default['eio']['reppolicy']
name = default['eio']['name']
bsize = default['eio']['bsize']

execute "install_eio" do 
  command <<-EOH 
    eio_cli create -d #{hdd} -s #{ssd} -p #{policy} -m #{mode} -b #{bsize} -c #{name}
  EOH
  only_if { FileTest.blockdev?(ssd) && FileTest.blockdev?(hdd) && !FileTest.exists?("/proc/enhanceio/" + name) }
end

