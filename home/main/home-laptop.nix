{ local, ... }:
{
  home.username = local.username;
  home.homeDirectory = "/home/${local.username}";
  home.stateVersion = "26.05";
  imports = [
    # fichier individuel dans packages = programs.xyz existant
    # sinon, dans other_apps*
    ./config/packages/packagesLight.nix
    ./shared.nix
    # dotfiles
    ./externalDotfiles.nix
  ];
  # désactivation de stylix pour des logiciels lourds comme inkscape
  stylix.targets.gtksourceview.enable = false;
  home.pointerCursor.enable = true;
}
