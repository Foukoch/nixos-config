{ local, ... }:
{
  home.username = local.username;
  home.homeDirectory = "/home/${local.username}";
  home.stateVersion = "26.05";
  imports = [
    # fichier individuel dans packages = programs.xyz existant
    # sinon, dans other_apps*
    ./config/programs/others/obs.nix
    ./config/packages/packages.nix
    ./shared.nix
    # dotfiles
    ./externalDotfiles.nix
  ];
  home.pointerCursor.enable = true;
}
