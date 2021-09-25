#!/bin/bash
# Basic infinite looper
#
# edit: xmrig-proxy is known to crash.
# The following makes sure that it will be restarted.

for ((;;)); do
	xmrig ;
done
