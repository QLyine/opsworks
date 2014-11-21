client = Route53::Client.new(node[:app][:custom_access_key], node[:app][:custom_secret_key])

name = "www.test.aptoide.com"
value = node[:opsworks][:instance][:public_ip]
type = "A"
zone_id = node[:app][:dns_zone_id]

client.create_or_append_record(name, value, type, 60, zone_id)
