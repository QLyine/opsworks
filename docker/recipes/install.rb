package "docker.io" do
  action :install
end

service "docker" do
  action :start
end
