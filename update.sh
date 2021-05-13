#!/bin/bash
echo "Monero mining reposotory syncing..."
git pull
echo "Refreshing xmrig..."
sh miner-downloader.sh
echo "Refreshing xmrig-proxy..."
sh proxy-downloader.sh
