#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────
#  Installation NixOS — choix de la machine (host)
#  Usage :
#     ./install.sh                 → menu interactif
# ─────────────────────────────────────────────────────────────────────
set -euo pipefail
export NIX_CONFIG="experimental-features = nix-command flakes"

# Clés publiques des caches (identiques pour tous les hosts).
PUBKEYS="cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="

# Chemin attendu par flake.nix (import /home/afoucaultc/nixos-machine/local.nix)
LOCAL_NIX_DIR="$HOME/nixos-machine"
LOCAL_NIX_FILE="$LOCAL_NIX_DIR/local.nix"

# ── 1. Choix du host ─────────────────────────────────────────────────
HOST="${1:-}"
if [ -z "$HOST" ]; then
        echo "Quelle machine installer ?"
        echo "  1) nixos-home    (poste maison)"
        echo "  2) nixos-laptop  (ThinkPad E560 — léger, faible RAM)"
        read -rp "Choix [1/2] : " choix
        case "$choix" in
                1) HOST="nixos-home" ;;
                2) HOST="nixos-laptop" ;;
                *) echo "Choix invalide." ; exit 1 ;;
        esac
fi

if [ ! -d "$HOME/nixos-config/hosts/$HOST" ]; then
        echo "Host inconnu : $HOST"
        echo "Hosts disponibles :"
        ls "$HOME/nixos-config/hosts/"
        exit 1
fi
echo "→ Installation du host : $HOST"

# ── 2. Fichier local.nix (hors repo, infos perso) ────────────────────
mkdir -p "$LOCAL_NIX_DIR"
if [ ! -f "$LOCAL_NIX_FILE" ]; then
        echo "→ $LOCAL_NIX_FILE absent, création depuis le modèle."
        cp "$HOME/nixos-config/local_exemple.nix" "$LOCAL_NIX_FILE"
        "${EDITOR:-nano}" "$LOCAL_NIX_FILE"
fi

if grep -q '"CHANGE"' "$LOCAL_NIX_FILE"; then
        echo "✗ $LOCAL_NIX_FILE contient encore des valeurs par défaut (\"CHANGE\")."
        echo "  Édite-le avant de continuer : $LOCAL_NIX_FILE"
        exit 1
fi
echo "✓ local.nix OK ($LOCAL_NIX_FILE)"

# ── 3. Clé age sops-nix de la machine ─────────────────────────────────
if [ ! -f /var/lib/sops-nix/key.txt ]; then
        echo "→ Génération de la clé age de la machine..."
        sudo mkdir -p /var/lib/sops-nix
        nix shell nixpkgs#age -c age-keygen -o /tmp/age-key.txt
        sudo mv /tmp/age-key.txt /var/lib/sops-nix/key.txt
        sudo chmod 600 /var/lib/sops-nix/key.txt

        PUBKEY="$(sudo nix shell nixpkgs#age -c age-keygen -y /var/lib/sops-nix/key.txt)"
        echo "─────────────────────────────────────────────────────────"
        echo "  Clé publique de $HOST : $PUBKEY"
        echo "  → Ajoute-la dans .sops.yaml (host_${HOST//-/_})"
        echo "  → Puis, depuis un poste ayant déjà accès en déchiffrement :"
        echo "      nix shell nixpkgs#sops --command sops updatekeys secrets/secrets.yaml"
        echo "  → Sans quoi le rebuild échouera : sops ne pourra pas déchiffrer"
        echo "    secrets/secrets.yaml pour cette machine."
        echo "─────────────────────────────────────────────────────────"
        read -rp "Appuie sur Entrée une fois .sops.yaml mis à jour et updatekeys effectué... " _
else
        echo "✓ Clé age machine déjà présente (/var/lib/sops-nix/key.txt)."
fi

# Substituters : on ajoute nix-community en plus pour le laptop.
if [ "$HOST" = "nixos-laptop" ]; then
        SUBS="https://cache.nixos.org https://hyprland.cachix.org https://nix-community.cachix.org"
else
        SUBS="https://cache.nixos.org https://hyprland.cachix.org"
fi

# ── 4. Copie du hardware-configuration généré ────────────────────────
cd
cp /etc/nixos/hardware-configuration.nix \
   "$HOME/nixos-config/hosts/$HOST/hardware-configuration.nix"

cd "$HOME/nixos-config"
nix-shell -p git --run "git add hosts/$HOST/hardware-configuration.nix"

# ── 5. Rebuild en s'appuyant au MAXIMUM sur les caches binaires ──────
# --impure requis : flake.nix importe local.nix via un chemin absolu
# hors du repo (/home/afoucaultc/nixos-machine/local.nix).
nix-shell -p git --run "sudo nixos-rebuild switch \
        --flake .#$HOST \
        --option substituters \"$SUBS\" \
        --option trusted-public-keys \"$PUBKEYS\" \
        --option max-jobs 1 \
        --impure"

echo "✓ Terminé pour $HOST. Reboot puis sélectionne la génération dans GRUB."
