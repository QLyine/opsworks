require 'net/http'
include_recipe 'route53'

route53_record "create a record" do
  name  node[:opsworks][:instance][:hostname] + '.test.aptoide.com'
  value Net::HTTP.get(URI.parse('http://169.254.169.254/latest/meta-data/public-ipv4'))
  type  "A"
  ttl   60
  zone_id               node[:app][:dns_zone_id]
  aws_access_key_id     node[:app][:custom_access_key]
  aws_secret_access_key node[:app][:custom_secret_key]
  overwrite true
  action :create
end

