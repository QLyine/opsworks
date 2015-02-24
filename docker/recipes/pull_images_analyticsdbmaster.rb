
# Pull latest analyticsdbmaster
script "pull_images" do  
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}" ;
    DATA="#{node[:app][:dockers_analyticsdbmaster][:data]}" ;
    [[ -n ${DATA} ]] && \ 
    docker pull ${DOMAIN}/${DATA}
    docker pull ${DOMAIN}/#{node[:app][:dockers_analyticsdbmaster][:image]}
  EOH
end

