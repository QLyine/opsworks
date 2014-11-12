script "install_certs" do
  interpreter "bash" 
  user "root"
  code <<-EOH
  DOMAIN="#{node[:app][:domain]}";
  IP="#{node[:app][:ip]}";
  DIR="/etc/docker/certs.d/${DOMAIN}";
  ODIR="/usr/local/share/ca-certificates/${DOMAIN}";
  FILE="devdockerCA.crt";
  USER="#{node[:app][:username]}";
  USER="#{node[:app][:password]}";
  echo "${IP}  ${DOMAIN} " >> /etc/hosts ;
  [[ ! -d $DIR ]] && mkdir -p $DIR ;
  [[ ! -d $ODIR ]] && mkdir -p $ODIR ;
  wget -O ${DIR} http://${USER}:${PASS}@${DOMAIN}/${FILE};
  wget -O ${ODIR} http://${USER}:${PASS}@${DOMAIN}/${FILE};
  update-ca-certificates;
  EOH
end
