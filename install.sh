#!/bin/bash
REPO=$(PWD)
echo "Monero mining installer"
echo "-----------------------"
echo "Launching updater to get latest version of XMRig and XMRig proxy from github..."
sh update.sh
echo "Copying files to /usr/local/bin... (needs root, you 'll be asked for password)"
sudo cp $PWD/downloads/xmrig-latest/xmrig /usr/local/bin/xmrig
sudo cp $PWD/downloads/xmrig-proxy-latest/xmrig-proxy /usr/local/bin/xmrig-proxy
sudo cp $PWD/tools/mine-looper.sh /usr/local/bin/monero-mining
sudo cp $PWD/tools/proxy-looper.sh /usr/local/bin/monero-proxy
sudo cp $PWD/update.sh /usr/local/bin/monero-mining-update
sudo cp $PWD/configure.sh /usr/local/bin/monero-mining-configure
echo "Configuring in donate mode..."
sh configure.sh --donate
echo "You can now start xmrig and let it run while you read the rest of the docs"

