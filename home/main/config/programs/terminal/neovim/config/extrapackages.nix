# binaires nécessaires
{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      # lsp
      nil # nix
      lua-language-server # lua
      texlab # latx
      python3 # python
      pyright # python v2

      # formatters
      nixfmt
      stylua
      ruff

      # tools
      zathura
      ripgrep
      fd
      octave
    ];
  };
}
