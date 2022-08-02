FROM docker.io/library/consul:1.12.3

COPY client.hcl /etc/consul.d/client.hcl

ENTRYPOINT ["consul", "agent", "-config-file=/etc/consul.d/client.hcl"]
