#!/usr/bin/env bash
# Usage : ./update.sh [nixos-home|nixos-laptop]
set -euo pipefail
HOST="${1:-$(hostname)}"
echo "→ Mise à jour du host : $HOST"
git add .
nix flake update
sudo nixos-rebuild switch --flake /home/afoucaultc/nixos-config#"$HOST" --impure
