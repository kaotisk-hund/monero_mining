#!/bin/bash
export TMP_FILE="/tmp/srsn0001"
title(){
	echo "$0 - Quick XMRig and thermal report"
	echo "--------------------------------------------"
}
usage(){
	echo "Usage:"
	echo " $0 <host>"
	echo "    host    The remote host you wish to gather data from"
	echo ""
}
if [ -z $1 ] ;then
	usage
	exit;
else
	export HOST=$1
	echo "Generating report..."
	echo "Report starts on $(date)" > $TMP_FILE
	echo "$HOST" >> $TMP_FILE
	echo "---------------------------------" >> $TMP_FILE
	ssh $HOST sensors >> $TMP_FILE
	echo "---------------------------------" >> $TMP_FILE
	ssh $HOST tail /home/$HOST/monero_mining/logs/xmrig.log >> $TMP_FILE
	echo "=================================" >> $TMP_FILE
	echo "=================================" >> $TMP_FILE
	echo "Report completed on $(date)" >> $TMP_FILE
	mv $TMP_FILE $HOME/Mining_reports/$(date +%Y%m%d_%H%M%S)-report
	echo "Report complete"
fi
