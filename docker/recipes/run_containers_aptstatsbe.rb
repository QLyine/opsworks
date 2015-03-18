script "run_#{node[:app][:dockers_aptstatsbe][:name]}_container" do
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}";
    ARGS="#{node[:app][:dockers_aptstatsbe][:arg]}";
    NAME="#{node[:app][:dockers_aptstatsbe][:name]}";
    IMAGE="#{node[:app][:dockers_aptstatsbe][:image]}";
    DATA="#{node[:app][:dockers_aptstatsbe][:data]}";
    if [ -n ${DATA} ] ; then 
      ARGS="${ARGS} --volumes-from ${DATA}"
      docker run -d --name=${DATA} ${DOMAIN}/${DATA} 
    fi 
    docker run -d ${ARGS} ${DOMAIN}/${IMAGE} bash
  EOH
end

