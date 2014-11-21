client = Route53::Client.new(node[:route53_registry][:aws_access_key_id], node[:route53_registry][:aws_secret_access_key])

name = node[:route53_registry][:name]
value = node[:opsworks][:instance][:private_ip]
type = "A"
zone_id = node[:route53_registry][:zone_id]

client.create_or_append_record(name, value, type, 60, zone_id)
