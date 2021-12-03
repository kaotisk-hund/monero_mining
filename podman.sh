#!/bin/bash
podman build -f ContainerFile -t monero-mining .
podman run -d --name monero-miner --privileged --network=host monero-mining
SERVICE=$(podman generate systemd --files --name monero-miner)
systemctl enable --user SERVICE
podman stop monero-miner
systemctl start --user container-monero-miner.service

