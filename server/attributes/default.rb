default[:redis][:sysctl] = Mash.new
default[:redis][:sysctl]['vm.swappiness']=0
default[:redis][:sysctl]['net.ipv4.tcp_sack']=1
default[:redis][:sysctl]['net.ipv4.tcp_timestamps']=1
default[:redis][:sysctl]['net.ipv4.tcp_window_scaling']=1
default[:redis][:sysctl]['net.ipv4.tcp_congestion_control']='htcp'
default[:redis][:sysctl]['net.ipv4.tcp_syncookies']=1
default[:redis][:sysctl]['net.ipv4.tcp_tw_recycle']=1

