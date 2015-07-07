script "run_#{node[:app][:dockers_phpbev7][:name]}_container" do
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}";
    ARGS="#{node[:app][:dockers_phpbev7][:arg]}";
    NAME="#{node[:app][:dockers_phpbev7][:name]}";
    IMAGE="#{node[:app][:dockers_phpbev7][:image]}";
    DATA="#{node[:app][:dockers_phpbev7][:data]}";
    if [ -n ${DATA} ] ; then 
      ARGS="${ARGS} --volumes-from ${DATA}"
      docker run -d --name=${DATA} ${DOMAIN}/${DATA} 
    fi 
    docker run -d ${ARGS} ${DOMAIN}/${IMAGE} /sbin/my_init
  EOH
end

