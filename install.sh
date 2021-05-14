#!/bin/bash
echo "Monero mining installer"
echo "-----------------------"
echo "Launching updater to get latest version of XMRig and XMRig proxy from github..."
sh utils/updater.sh
echo "Creating symlinks... (need root)"
sudo ln -s $PWD/downloads/xmrig-latest/xmrig /usr/local/bin/xmrig
sudo ln -s $PWD/downloads/xmrig-proxy-latest/xmrig-proxy /usr/local/bin/xmrig
echo "Configuring in donate mode..."
sh configure.sh --donate
echo "You can now start xmrig and let it run while you read the rest of the docs"

