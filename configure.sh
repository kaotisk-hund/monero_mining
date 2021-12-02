#!/bin/bash
# Configure XMRig and XMRig-proxy
#
export APP_NAME=$(basename $0)
export LOGS=$PWD"/logs/mining"
export XM_CONF=$HOME"/.xmrig.json"
export XP_CONF=$PWD"/downloads/xmrig-proxy-latest/config.json"

title(){
	echo "$APP_NAME - XMRig and XMRig-proxy configurator"
	echo "-------------------------------------------------"
}

usage(){
	echo "Usage:"
	echo ""
	echo " $APP_NAME --direct host"
	echo " $APP_NAME --donate"
	echo " $APP_NAME --help"
	echo " $APP_NAME --only-proxy host address"
	echo " $APP_NAME --proxy host address"
	echo " $APP_NAME --solo host address"
	echo ""
	echo "    --direct       Direct mining to an already set up xmrig-proxy."
	echo "    --donate       Donate to the author of the script."
	echo "    --help         Prints this help message."
	echo "    --only-proxy   Sets up only xmrig-proxy."
	echo "    --proxy        Setup xmrig-proxy too (used when have more than one rigs)."
	echo "    --solo         Direct mining to pool (aka solo mining)."
	echo "    --donate       Yes, donate something :)"
	echo "    host           Where you send your hashes (xmrig proxy address or pool address)."
	echo "    address        The monero address you want your money to be transfered to."
	exit
}

logs(){
	echo "Checking for logs' folder and create or not"
	if [ -d "$LOGS" ]; then echo "Folder is already there.";else mkdir -p $LOGS && echo "$LOGS created";fi
}

xmrig(){
	echo "Copying xmrig default configuration"
	cp config/xmrig.json $XM_CONF
}

address(){
	echo "Setting up address $ADDRESS for xmrig"
	sed -i.bak -e 's/"x"/'$ADDRESS'/' $XM_CONF
}
pool(){
	echo "Setting host to: $POOL"
	sed -i.bak -e 's/$POOL/'$POOL'/' $XM_CONF
}
donate(){
	sed -i.bak -e 's/$POOL/'h.kaotisk-hund.com:3333'/' $XM_CONF
}

proxy(){
	echo "Copying xmrig-proxy default configuration"
	cp config/xmrig-proxy.json $XP_CONF
	echo "Setting address to: $ADDRESS"
	sed -i.bak -e 's/$ADDRESS/'$ADDRESS'/' $XP_CONF
}

title
#[[ ! -z $1 ]] && export OPTION=$1 || usage
case $1 in
	"--direct")
		if [ ! -z $2 ]; then
			export POOL=$2
			logs
			xmrig
			pool;
		else
			echo "No host"
			exit 1;
		fi
		;;
	"--proxy")
		if [ ! -z $2 ] && [ ! -z $3 ]; then
			export POOL=$2
			export ADDRESS=$3
			logs
			xmrig
			proxy
			pool;
		else
			echo "No host or address"
			exit 1;
		fi
		;;
	"--only-proxy")
		if [ ! -z $2 ] && [ ! -z $3 ]; then
			export POOL=$2
			export ADDRESS=$3
			logs
			proxy;
		else
			echo "No host or address"
			exit 1;
		fi
		;;
	"--donate")
		logs
		xmrig
		donate
		;;
	"--solo")
		if [ ! -z $2 ] && [ ! -z $3 ]; then
			export POOL=$2
			export ADDRESS=$3
			logs
			xmrig
			address
			pool;
		else
			echo "No host or address"
			exit 1;
		fi
		;;
	"--help" | *)
		usage;
		;;
esac
