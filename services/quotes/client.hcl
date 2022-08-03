// node_name = "consul-client1"
datacenter = "dc1"
data_dir   = "/consul/data"
log_level  = "INFO"
retry_join = ["consul-server1", "consul-server2", "consul-server3"]
service {
    name = "quotes"
    id   = "quotes"
    tags = ["client", "quotes", "service"]
    port = 80

    check {
        name = "client-check"
        http = "http://localhost:80/health"
        interval = "10s"
        timeout = "1s"
        tls_skip_verify = true
    }
}
