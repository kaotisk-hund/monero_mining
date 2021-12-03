#!/bin/bash
screen -dmS xmrig-running /usr/bin/xmrig
tail -f logs/xmrig.log
