#!/bin/bash

# Path to your public key
PUB_KEY="$HOME/.ssh/id_rsa.pub"
INVENTORY="inventory"

if [[ ! -f $PUB_KEY ]]; then
  echo "❌ Public key not found at $PUB_KEY"
  exit 1
fi

# Read each host and copy SSH key
echo "🚀 Pushing public key to target hosts..."
grep -vE '^\[|^$|^#' "$INVENTORY" | while read -r host; do
  echo "🔑 Pushing key to $host"
  ssh-copy-id -i "$PUB_KEY" "root@$host" || echo "⚠️  Failed to push key to $host"
done

echo "✅ Key distribution complete."
