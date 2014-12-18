script "run_#{node[:app][:dockers_pgboucner][:name]}_container" do
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}";
    ARGS="#{node[:app][:dockers_pgboucner][:arg]}";
    NAME="#{node[:app][:dockers_pgboucner][:name]}";
    IMAGE="#{node[:app][:dockers_pgboucner][:image]}";
    DATA="#{node[:app][:dockers_pgboucner][:data]}";
    if [[ -n ${DATA} && ${DATA} != "" ]] ; then 
      ARGS="${ARGS} --volumes-from ${DATA}"
      docker run -d --name=${DATA} ${DOMAIN}/${DATA} 
    fi 
    docker run -d ${ARGS} ${DOMAIN}/${IMAGE} /sbin/my_init
  EOH
end

