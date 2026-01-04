#!/bin/bash

echo "Enter website with wordpress directory: "

read SITE

# Run WPScan with comprehensive enumeration flags
wpscan --url "$SITE" \
  --enumerate u,tt,p,t,cb,dbe,m \
  --random-user-agent \
  --disable-tls-checks \
  --plugins-detection mixed

# Explanation:
# u  = usernames
# p  = plugins
# tt = timthumbs
# t  = themes
# vp = vulnerable plugins
# vt = vulnerable themes
# cb = config backups
# dbe = database exports
# m  = media (if exposed)
