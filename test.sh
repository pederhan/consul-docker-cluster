#!/bin/bash

# Run curl 4 times for each service and print response
N_ITERATIONS=4
if [ -n "$1" ]; then # if argument 1 is provided, override N_ITERATIONS
    N_ITERATIONS=$1
fi




echo "Testing the currency service"
for (( i=1; i<=$N_ITERATIONS; i++ ))
do
    docker exec consul-server1 curl -s http://currency.service.consul/rate/USD?target=ZWL
    echo
done
echo

echo "Testing the quotes service"
for (( i=1; i<=$N_ITERATIONS; i++ ))
do
    docker exec consul-server1 curl -s http://quotes.service.consul/
    echo
done
echo


echo "Testing /discover from currency service to quotes service"
for (( i=1; i<=$N_ITERATIONS; i++ ))
do
    docker exec consul-server1 curl -s http://currency.service.consul/discover
    echo
done
echo

echo "Testing /discover from currency service to quotes service"
for (( i=1; i<=$N_ITERATIONS; i++ ))
do
    docker exec consul-server1 curl -s http://quotes.service.consul/discover
    echo
done
echo
