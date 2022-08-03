# DNS Server Discovery with Consul

intro

## Running


```bash
docker compose build
docker compose up -d
```

This creates a Consul cluster consisting of 7 containers, of which 3 are Consul Server agents and 4 are Consul Client agents.
The 4 clients consist of 2 containers running a mock currency API, and 2 containers running a mock quotes API.


## Cluster Structure

```
Network
├── Server Agents
│   ├── consul-agent1
│   ├── consul-agent2
│   └── consul-agent3
├── Currency Service
│   ├── currency-client1
│   └── currency-client2
└── Quotes Service
    ├── quotes-client1
    └── quotes-client2
```

## Testing the Cluster

Run `./test.sh`.

Optionally specify number of iterations for each service (by default 4):

`./test.sh [N_ITERATIONS]`




## TODO

* find out why `docker compose up -d --build` doesn't work when re-using image in compose file.