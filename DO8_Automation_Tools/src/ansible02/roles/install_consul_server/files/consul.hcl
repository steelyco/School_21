datacenter = "dc1"
data_dir = "/opt/consul/data"
node_name = "consul-server-1"
server = true
bootstrap_expect = 1
ui_config {
  enabled = true
}

bind_addr = "192.168.50.6"
client_addr = "0.0.0.0"
advertise_addr = "192.168.50.6"

disable_update_check = true

pid_file = "/var/run/consul/consul.pid"

ports {
  http = 8500
  dns = 8600
  serf_lan = 8301
  serf_wan = 8302
  server = 8300
}
