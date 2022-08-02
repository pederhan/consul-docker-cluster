server    = true
ui_config {
  enabled = true
}
datacenter = "dc1"
data_dir   = "consul/data"
log_level  = "INFO"
addresses {
  http = "0.0.0.0"
}
retry_join = [
  "consul-server2",
  "consul-server3"
]
connect {
  enabled = true
}
