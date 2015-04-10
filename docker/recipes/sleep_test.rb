#script "shutdown_#{node[:app][:dockers_aptstatsbe][:name]}_container" do
#  interpreter "bash"
#  user "root"
#  code <<-EOH
#    DOMAIN="#{node[:app][:domain]}";
#    ARGS="#{node[:app][:dockers_aptstatsbe][:arg]}";
#    NAME="#{node[:app][:dockers_aptstatsbe][:name]}";
#    IMAGE="#{node[:app][:dockers_aptstatsbe][:image]}";
#    DATA="#{node[:app][:dockers_aptstatsbe][:data]}";
#    CONTAINERID=`docker ps | grep ${IMAGE} | awk '{print $1}'`
#    [[ -n ${CONTAINERID} ]] && \
#      docker exec -it ${CONTAINERID} sleep 1200
#  EOH
#end

bash "sleep_#{node[:app][:dockers_aptstatsbe][:name]}_container" do 
  timeout "3600"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}";
    ARGS="#{node[:app][:dockers_aptstatsbe][:arg]}";
    NAME="#{node[:app][:dockers_aptstatsbe][:name]}";
    IMAGE="#{node[:app][:dockers_aptstatsbe][:image]}";
    DATA="#{node[:app][:dockers_aptstatsbe][:data]}";
    CONTAINERID=`docker ps | grep ${IMAGE} | awk '{print $1}'`
    [[ -n ${CONTAINERID} ]] && \
      docker exec -it ${CONTAINERID} sleep 1200
  EOH
end
