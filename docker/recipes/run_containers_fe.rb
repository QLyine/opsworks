script "run_#{name}_container" do
  interpreter "bash"
  user "root"
  code <<-EOH
    DOMAIN="#{node[:app][:domain]}"
    ARGS="#{node[:app][:dockers_nginx][:arg]}"
    NAME="#{node[:app][:dockers_nginx][:name]}"
    IMAGE="#{node[:app][:dockers_nginx][:image]}"
    docker run -d ${ARGS} --name=${NAME} ${DOMAIN}/${IMAGE} /sbin/my_init
  EOH
end
