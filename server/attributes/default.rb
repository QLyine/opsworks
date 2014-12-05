default[:redis][:sysctl] = Mash.new
default[:redis][:sysctl]['vm.swappiness']=0
default[:redis][:sysctl]['net.ipv4.tcp_sack']=1
default[:redis][:sysctl]['net.ipv4.tcp_timestamps']=1
default[:redis][:sysctl]['net.ipv4.tcp_window_scaling']=1
default[:redis][:sysctl]['net.ipv4.tcp_congestion_control']='htcp'
default[:redis][:sysctl]['net.ipv4.tcp_syncookies']=1
default[:redis][:sysctl]['net.ipv4.tcp_tw_recycle']=1
default[:redis][:sysctl]['net.ipv4.tcp_slow_start_after_idle']=0
default[:redis][:sysctl]['net.ipv4.ip_no_pmtu_disc']=1
default[:redis][:sysctl]['net.ipv4.tcp_sack']=1
default[:redis][:sysctl]['net.ipv4.tcp_timestamps']=1

default[:redis][:sysctl]['net.core.rmem_max']=16777216
default[:redis][:sysctl]['net.core.2mem_max']=16777216

default[:redis][:sysctl]['net.ipv4.tcp_rmem']=4096 524288 16777216
default[:redis][:sysctl]['net.ipv4.tcp_wmem']=4096 524288 16777216



