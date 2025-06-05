#!/bin/bash

# Resolve the directory path where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INVENTORY="$SCRIPT_DIR/inventory"

echo "🔐 Establishing SSH connection to all inventory hosts..."

# Read inventory and connect to each host
grep -vE '^\[|^$|^#' "$INVENTORY" | while read -r host; do
  echo "➡️  Connecting to $host..."
  ssh -o BatchMode=yes -o ConnectTimeout=5 "$host" "echo '✅ Connected to $host'" || echo "❌ Failed to connect to $host"
done

echo "✅ SSH connection attempts completed."
