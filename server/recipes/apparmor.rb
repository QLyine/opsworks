node node[:platform]
when "ubuntu"
  actions = node[:apparmor][:disable] ? [:stop, :disable] : [:start, :enable]
  service "apparmor" do
    action actions
    supports [ :restart, :reload, :status ]
  end
end
