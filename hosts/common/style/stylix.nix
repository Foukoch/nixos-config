{ pkgs, ... }:
{
  # style global
  stylix = {
    enable = true;
    targets.gtksourceview.enable = false;
    #targets.nixvim.enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.texlivePackages.luciole;
        name = "Luciole";
      };
      sizes = {
        applications = 11;
        terminal = 12;
      };
    };
  };
}
