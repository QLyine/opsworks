script "run_#{node[:app][:dockers_phpbe][:name]}_container" do
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}";
    ARGS="#{node[:app][:dockers_phpbe][:arg]}";
    NAME="#{node[:app][:dockers_phpbe][:name]}";
    IMAGE="#{node[:app][:dockers_phpbe][:image]}";
    DATA="#{node[:app][:dockers_phpbe][:data]}";
    if [ -n ${DATA} ] ; then 
      ARGS="${ARGS} --volumes-from ${DATA}"
      docker run -d --name=${DATA} ${DOMAIN}/${DATA} 
    fi 
    docker run -d ${ARGS} ${DOMAIN}/${IMAGE} /sbin/my_init
  EOH
end

