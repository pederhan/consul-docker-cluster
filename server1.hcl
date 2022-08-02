server    = true
node_name = "consul-server1"
// bootstrap = true
ui_config {
  enabled = true
}
datacenter = "dc1"
data_dir   = "/consul/data"
log_level  = "INFO"
addresses {
  http = "0.0.0.0"
}
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
advertise_addr = "10.5.0.2"
retry_join = [
  "consul-server2",
  "consul-server3"
]
connect {
  enabled = true
}
ports {
  dns = 53
  http = 8500
}
service {
  id      = "dns"
  name    = "dns"
  tags    = ["primary"]
  address = "localhost"
  port    = 53
  enable_tag_override = false
  check {
    id       = "dns"
    name     = "Consul DNS TCP on port 53"
    tcp      = "localhost:53"
    interval = "10s"
    timeout  = "1s"
  }
}