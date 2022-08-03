#!/bin/bash

consul agent -config-file=/consul/config/client.hcl &
uvicorn quotes:app --host 0.0.0.0 --port 80
