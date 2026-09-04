{ config, pkgs, ... }:
{
  programs.nixvim.plugins.vimtex = {
    enable = true;
    autoLoad = true;
    settings = {
      view_method = "zathura";
      complete_close_brace = 1;
      format_enabled = 0;
      imaps_enabled = 0;
      complete_enabled = 0;
      syntax_enabled = 0;
      compiler_latexmk = {
        aux_dir = "${config.home.homeDirectory}/.aux-tex/";
        out_dir = ".";
        executable = "${pkgs.texliveFull}/bin/latexmk";
      };
    };
  };
}
