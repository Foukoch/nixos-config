# ajouter un plugin : nouveau fichier dans ./plugin puis ajouter
# le lien à ce fichier dans ./config/plugins.nix
{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./config/extrafiles.nix
    ./config/extrapackages.nix
    ./config/extraplugins.nix
    ./config/globals.nix
    ./config/keymaps.nix
    ./config/plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    nixpkgs.source = pkgs.path;
    extraPackages = [
      pkgs.texliveFull
    ];
  };
  home.packages = with pkgs; [
    trash-cli
  ];
}
