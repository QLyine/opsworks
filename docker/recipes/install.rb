script "update_docker_repo" do  
  interpreter "bash"
  user "root"
  code <<-EOH
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9;
    echo 'deb https://get.docker.io/ubuntu docker main' > /etc/apt/sources.list.d/docker.list;
    apt-get update ;
    apt-get install -y --force-yes lxc-docker-1.3.1;
  EOH
end  

if node['docker']['opts'] 

  directory "/mnt/dockerdata" do
    owner 'root'
    group 'root'
    mode '700'
    action :create
  end

  template '/etc/default/docker' do 
    source "docker.sysconfig.erb"
    mode "0644"
  end

  service "docker" do
    case node["platform"]
    when "ubuntu"
      if node["platform_version"].to_f >= 9.10
        provider Chef::Provider::Service::Upstart
      end
    end
    supports :restart => true
    subscribes :restart, "template[/etc/default/docker]", :immediately
  end

end

