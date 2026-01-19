datacenter = "dc1"
data_dir = "/opt/consul/data"
node_name = "api-service-1"
server = false

bind_addr = "192.168.50.7"
client_addr = "0.0.0.0"

advertise_addr = "192.168.50.7"

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
  name = "hotel-service"
  port = 5432
  connect {
    sidecar_service {
      proxy {
        upstreams = [
          {
            destination_name = "postgresql"
            local_bind_address = "127.0.0.1"
            local_bind_port  = 5432
          }
        ]
      }
    }
  }
}
