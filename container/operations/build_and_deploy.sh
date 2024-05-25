#!/bin/bash

docker build . -t paper2/cloud-run-debugger

# NOTE: require login before.
docker push paper2/cloud-run-debugger:latest