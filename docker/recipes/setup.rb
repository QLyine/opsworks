script "install_certs" do
  interpreter "bash" 
  user "root"
  code <<-EOH
  DOMAIN="#{node[:app][:domain]}";
  DIR="/etc/docker/certs.d/${DOMAIN}";
  ODIR="/usr/local/share/ca-certificates/${DOMAIN}";
  FILE="devdockerCA.crt";
  USER="#{node[:app][:username]}";
  PASS="#{node[:app][:password]}";
  [[ ! -d $DIR ]] && mkdir -p $DIR ;
  [[ ! -d $ODIR ]] && mkdir -p $ODIR ;
  wget -O ${DIR}/${FILE}  "http://${USER}:${PASS}@${DOMAIN}/${FILE}";
  wget -O ${ODIR}/${FILE} "http://${USER}:${PASS}@${DOMAIN}/${FILE}";
  update-ca-certificates;
  EOH
end
