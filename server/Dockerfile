FROM docker.io/library/consul:1.12.3

COPY server.hcl /etc/consul.d/server.hcl

ENTRYPOINT ["consul", "agent", "-config-file=/etc/consul.d/server.hcl"]
