node_name = "consul-client1"
datacenter = "dc1"
data_dir   = "/consul/data"
log_level  = "INFO"
retry_join = ["consul-server1", "consul-server2", "consul-server3"]
