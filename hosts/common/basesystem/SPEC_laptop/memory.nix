{ ... }:
{
  # privilège pour les paquets précompilés pour que la RAM ne soit pas trop sollicitée
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Caches binaires
    substituters = [
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-substituters = [
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    trusted-users = [
      "root"
      "@wheel"
    ];
    # utiliser les caches par défaut
    builders-use-substitutes = true;
    fallback = true; # si un cache tombe, on tente ailleurs
    connect-timeout = 10;
    # limitation de l'utilisation de la RAM
    max-jobs = 1; # une dérivation à la fois
    cores = 2; # les 2 coeurs du i5-6200U par job
  };
  # optimisation du store
  nix.settings.auto-optimise-store = true;
  # zram : compression du swap en RAM pour absorber les pics du rebuild
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 150;
    priority = 100;
  };
  # swap du noyau si nécessaire
  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "vm.page-cluster" = 0;
  };
  # empêche la machine de freeze totalement si un process est trop gourmand
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5; # agit quand il reste < 5% de RAM libre
    freeSwapThreshold = 5;
  };
}
