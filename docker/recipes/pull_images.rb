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
  docker login --username="${USER}" --password="${PASS}" --email="$[MAIL}" ${DOMAIN} ;
  EOH
end

# Pull latest Nginx
node[:app][:dockers].each do |name, image|
  script "pull_images" do  
    interpreter "bash"
    user "root"
    code <<-EOH
      DOMAIN="#{node[:app][:domain]}"
      docker pull ${DOMAIN}/#{image}
    EOH
  end
end
