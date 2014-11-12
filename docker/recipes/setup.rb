script "install_certs" do
  interpreter "bash" 
  user "root"
  code <<-EOH
  DIR="/etc/docker/certs.d/registry.aptoide.com";
  ODIR="/usr/local/share/ca-certificates/registry.aptoide.com";
  FILE="devdockerCA.crt";
  USER="#{node[:app][:username]}";
  USER="#{node[:app][:password]}";
  [[ ! -d $DIR ]] && mkdir -p $DIR ;
  [[ ! -d $ODIR ]] && mkdir -p $ODIR ;
  wget -O ${DIR} http://${USER}:${PASS}@registry.aptoide.com/${FILE};
  wget -O ${ODIR} http://${USER}:${PASS}@registry.aptoide.com/${FILE};
  update-ca-certificates;
  EOH
end
