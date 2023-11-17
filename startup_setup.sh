#!/bin/bash

# This script is launched by /etc/systemd/system/startopenspace.service
chmod 777 /run/docker.sock
docker compose -f /home/minimata/openspace/docker-compose.yml up -d