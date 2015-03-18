script "login_to_registry" do
  interpreter "bash" 
  user "root"
  code <<-EOH
  DOMAIN="#{node[:app][:domain]}";
  USER="#{node[:app][:username]}";
  PASS="#{node[:app][:password]}";
  MAIL="NONE";
  docker login --username="${USER}" --password="${PASS}" --email="${MAIL}" ${DOMAIN} ;
  EOH
end

# Pull latest aptstatsbe
script "pull_images" do  
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}" ;
    DATA="#{node[:app][:dockers_aptstatsbe][:data]}" ;
    [[ -n ${DATA} ]] && \ 
    docker pull ${DOMAIN}/${DATA}
    docker pull ${DOMAIN}/#{node[:app][:dockers_aptstatsbe][:image]}
  EOH
end

