# Pull each of our defined apps
#node[:my_docker].each do |name, image|  
#  script "pull_app_#{name}_image" do
#    interpreter "bash"
#    user "root"
#    code <<-EOH
#      docker pull #{image}
#    EOH
#  end
#end  

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

# Pull latest Nginx
script "pull_images" do  
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}" ;
    DATA="#{node[:app][:dockers_nginx][:data]}" ;
    [[ -n ${DATA} ]] && \ 
    docker pull ${DOMAIN}/${DATA}
    docker pull ${DOMAIN}/#{node[:app][:dockers_nginx][:image]}
  EOH
end

