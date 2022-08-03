# DNS Service Discovery with Consul

This repository contains an implementation of a Consul cluster with 3 server agents and 2 different services across 4 client agents. Service Discovery is facilitated through DNS.

## Running


```bash
docker compose build
docker compose up -d
```

These command create a Consul cluster consisting of 7 containers, of which 3 are Consul Server agents and 4 are Consul Client agents.
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

## Currency Service

The currency service exposes the following endpoints:

`GET /rate/{base_currency}?target={target_currency}`

Get the conversion rate between two currencies. (complete bogus)

`GET /discover`

Ask the currency service to contact the quotes service.

`GET /hostname`

Get the hostname of the node.

`GET /health`

Return health status (used by Consul health check).

## Quotes Service

The quotes service exposes the following endpoints:

`GET /`

Fetch a random movie quote.

`GET /discover`

Ask the quotes service to contact the currency service.

`GET /hostname`

Get the hostname of the node.

`GET /health`

Return health status (used by Consul health check).

## TODO

* find out why `docker compose up -d --build` doesn't work when re-using image in compose file.
