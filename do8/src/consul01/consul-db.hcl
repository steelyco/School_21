datacenter = "dc1"
data_dir = "/opt/consul/data"
node_name = "db-service-1"
server = false

bind_addr = "192.168.50.8"
client_addr = "0.0.0.0"

advertise_addr = "192.168.50.8"

retry_join = ["192.168.50.6"]

disable_update_check = true
pid_file = "/var/run/consul/consul.pid"

ports {
  http = 8500
  dns = 8600
  serf_lan = 8301
  grpc = 8502
}

connect {
  enabled = true
}

service {
  name = "postgresql"
  port = 5432
  connect {
    sidecar_service {
      proxy {
        upstreams = []
      }
    }
  }
}