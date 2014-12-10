default[:generic][:sysctl] = Mash.new
# SWAP 
default[:generic][:sysctl]['vm.swappiness']=0
# TCP
default[:generic][:sysctl]['net.ipv4.tcp_congestion_control']='htcp'
default[:generic][:sysctl]['net.core.rmem_max']=16777216
default[:generic][:sysctl]['net.core.wmem_max']=16777216


# Set minimum, default, and maximum TCP buffer limits
default[:generic][:sysctl]['net.ipv4.tcp_rmem']='"4096 524288 16777216"'
default[:generic][:sysctl]['net.ipv4.tcp_wmem']='"4096 524288 16777216"'

# Set maximum network input buffer queue length
default[:generic][:sysctl]['net.core.netdev_max_backlog']=250000

default[:generic][:sysctl]['net.ipv4.ip_local_port_range']='"1024 65000"'

default[:generic][:sysctl]['net.ipv4.tcp_slow_start_after_idle']=0
default[:generic][:sysctl]['net.ipv4.ip_no_pmtu_disc']=1
default[:generic][:sysctl]['net.ipv4.tcp_timestamps']=1
default[:generic][:sysctl]['net.ipv4.tcp_syncookies']=1
default[:generic][:sysctl]['net.ipv4.tcp_tw_reuse']=1

# SWAP SPEC
default['create-swap']['swap-location'] = '/var/fileswap'
default['create-swap']['swap-size'] = 1 # In gigabytes
