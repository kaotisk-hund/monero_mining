#!/bin/bash
echo "Monero mining reposotory syncing..."
git pull
echo "Refreshing xmrig..."
sh utils/updater.sh xmrig xmrig
echo "Refreshing xmrig-proxy..."
sh utils/updater.sh xmrig xmrig-proxy
