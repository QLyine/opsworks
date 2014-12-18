script "run_#{node[:app][:dockers_pgbouncer][:name]}_container" do
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}";
    ARGS="#{node[:app][:dockers_pgbouncer][:arg]}";
    NAME="#{node[:app][:dockers_pgbouncer][:name]}";
    IMAGE="#{node[:app][:dockers_pgbouncer][:image]}";
    DATA="#{node[:app][:dockers_pgbouncer][:data]}";
    if [[ -n ${DATA} || ${DATA} != "" ]] ; then 
      ARGS="${ARGS} --volumes-from ${DATA}"
      docker run -d --name=${DATA} ${DOMAIN}/${DATA} 
    fi 
    docker run -d ${ARGS} ${DOMAIN}/${IMAGE} /sbin/my_init
  EOH
end

