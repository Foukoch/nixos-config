#!/usr/bin/env bash
set -euo pipefail
HOST="${1:-$(hostname)}" # trouve le host
USER_HOME=$(getent passwd "${SUDO_USER:-$USER}" | cut -d: -f6) # récupère le path du home
echo "→ Rebuild (sans update) : $HOST"
sudo nixos-rebuild switch --flake "path:$USER_HOME/nixos-config#$HOST" --impure
