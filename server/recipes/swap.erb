swap_size_megs = (node['create-swap']['swap-size'] * 1024)

execute 'create swapfile' do
  command <<-EOF.gsub(/^\s{4}/, '')
    dd if=/dev/zero of=#{node['create-swap']['swap-location']} bs=1M count=#{swap_size_megs}
    chmod 600 #{node['create-swap']['swap-location']}
    mkswap #{node['create-swap']['swap-location']}
  EOF

  not_if { ::File.exists? node['create-swap']['swap-location'] }
end

mount 'none' do
  action :enable
  device node['create-swap']['swap-location']
  fstype 'swap'
end

execute 'activate swap' do
  command 'swapon -a'
end
