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

# Pull latest redispers
script "pull_images" do  
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}" ;
    DATA="#{node[:app][:dockers_redispers][:data]}" ;
    [[ -n ${DATA} ]] && \ 
    docker pull ${DOMAIN}/${DATA}
    docker pull ${DOMAIN}/#{node[:app][:dockers_redispers][:image]}
  EOH
end

