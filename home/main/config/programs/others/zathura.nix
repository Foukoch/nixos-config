{ pkgs, ... }:
{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      window-title-basename = true;
      recolor = false;
      adjust-open = "best-fit";
      scroll-step = 60;
    };
    mappings = {
      "<C-i>" = "recolor";
    };
    extraConfig = ''
      set synctex true
      set synctex-editor-command "nvim --headless -es --cmd \"VimtexInverseSearch %{line} '%{input}'\""
    '';
  };

  home.packages = with pkgs; [
    poppler-utils
  ];
}
