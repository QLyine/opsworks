
script "login_to_registry" do
  interpreter "bash" 
  user "root"
  code <<-EOH
  page_size=`getconf PAGE_SIZE` ;
  phys_pages=`getconf _PHYS_PAGES` ;
  shmall=`expr $phys_pages / 2` ;
  shmmax=`expr $shmall \* $page_size` ;
  sysctl -w kernel.shmmax=$shmmax ;
  sysctl -w kernel.shmall=$shmall ;
  EOH
end

