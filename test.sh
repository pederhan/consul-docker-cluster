#!/bin/bash

# Run curl 4 times for each service and print response
N_ITERATIONS=4
if [ -n "$1" ]; then # if argument 1 is provided, override N_ITERATIONS
    N_ITERATIONS=$1
fi

JQ_CMD="cat"
if [ -n "$(command -v jq)" ]; then
    JQ_CMD="jq -c -j"
fi


echo "Testing the Currency service"
for (( i=1; i<=$N_ITERATIONS; i++ ))
do
    docker exec consul-server1 curl -s http://currency.service.consul/rate/USD?target=ZWL | $JQ_CMD
    echo
done
echo

echo "Testing the Quotes service"
for (( i=1; i<=$N_ITERATIONS; i++ ))
do
    docker exec consul-server1 curl -s http://quotes.service.consul/ | $JQ_CMD
    echo
done
echo


echo "Testing /discover from Currency to Quotes service"
for (( i=1; i<=$N_ITERATIONS; i++ ))
do
    docker exec consul-server1 curl -s http://currency.service.consul/discover | $JQ_CMD
    echo
done
echo

echo "Testing /discover from Quotes to Currency"
for (( i=1; i<=$N_ITERATIONS; i++ ))
do
    docker exec consul-server1 curl -s http://quotes.service.consul/discover | $JQ_CMD
    echo
done
echo
