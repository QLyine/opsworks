
script "pgkernel" do
  interpreter "bash" 
  user "root"
  code <<-EOH
  page_size=`getconf PAGE_SIZE` ;
  phys_pages=`getconf _PHYS_PAGES` ;
  shmall=`expr $phys_pages / 2` ;
  shmmax=`expr $shmall \* $page_size` ;
  echo "kernel.shmmax=$shmmax" >> /etc/sysctl.conf ;
  echo "kernel.shmall=$shmall" >> /etc/sysctl.conf ;
  sysctl -p ;
  EOH
end

