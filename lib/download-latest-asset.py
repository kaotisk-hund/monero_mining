#!/usr/bin/python3.8
import sys
from json import loads as l
import requests
user=sys.argv[1]
repo=sys.argv[2]
suffix="linux-x64.tar.gz"
link = "https://api.github.com/repos/"+user+"/"+repo+"/releases/latest"
f = requests.get(link)
x = l(f.text)
for s in x['assets']:
    if s['name'].endswith(suffix):
        print(''.join(s['browser_download_url']))
