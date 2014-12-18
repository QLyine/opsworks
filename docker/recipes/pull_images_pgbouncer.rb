# Pull latest pgboucner
script "pull_images" do  
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}" ;
    DATA="#{node[:app][:dockers_pgboucner][:data]}" ;
    [[ -n ${DATA} || ${DATA} != " " ]] && \ 
    docker pull ${DOMAIN}/${DATA} ;
    docker pull ${DOMAIN}/#{node[:app][:dockers_pgboucner][:image]}
  EOH
end

