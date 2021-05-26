#!/bin/bash
echo "Monero mining installer"
echo "-----------------------"
echo "Launching updater to get latest version of XMRig and XMRig proxy from github..."
sh update.sh
echo "Creating symlinks... (need root)"
sudo ln -s $PWD/downloads/xmrig-latest/xmrig /usr/local/bin/xmrig
sudo ln -s $PWD/downloads/xmrig-proxy-latest/xmrig-proxy /usr/local/bin/xmrig-proxy
sudo ln -s $PWD/tools/mine-looper.sh /usr/local/bin/monero-mining
sudo ln -s $PWD/tools/proxy-looper.sh /usr/local/bin/monero-proxy
sudo ln -s $PWD/update.sh /usr/local/bin/monero-mining-update
sudo ln -s $PWD/configure.sh /usr/local/bin/monero-mining-configure
echo "Configuring in donate mode..."
sh configure.sh --donate
echo "You can now start xmrig and let it run while you read the rest of the docs"

