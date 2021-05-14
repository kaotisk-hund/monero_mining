#!/bin/bash
echo "Latest asset downloader"
echo "-----------------------"
download(){
	echo "Downloading..."
	wget $(python3.8 ./lib/download-latest-asset.py $OWNER $PROG ) -O $PROG-latest.tar.gz
	echo "Extracting..."
	tar xvfz $PROG-latest.tar.gz
	if [ ! -d "downloads" ]; then mkdir $PWD/downloads;fi
	echo "Updating..."
	export tag="$(curl --silent -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/$OWNER/$PROG/releases/latest" | grep tag_name | cut -d '"' -f 4 | sed -e 's/v//')"
	rm -rf downloads/$PROG-$tag
	mv $PROG-$tag downloads/
	echo "Linking..."
	rm -rf $PROG-latest
	ln -s $PWD/downloads/$PROG-$tag $PWD/downloads/$PROG-latest
	echo "Cleaning..."
	rm $PROG-latest.tar.gz
}

if [ ! -z $1 ] && [ ! -z $2 ]; then
	export OWNER=$1
	export PROG=$2
	download;
else
	echo "No owner or program";
fi
