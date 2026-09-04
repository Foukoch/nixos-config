{ ... }:
{
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true; # gère proprement les très gros fichiers
      quickfile.enabled = true; # affichage plus rapide au démarrage
      indent.enabled = true; # guides d'indentation visuels
    };
  };
}
