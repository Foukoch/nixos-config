{ ... }:
{
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = [ "nixfmt" ];
            python = [
              "ruff_format"
              "ruff_fix"
            ];
            matlab = [ "mh_style" ];
            octave = [ "mh_style" ];
            tex = [ "latexindent" ];
            lua = [ "stylua" ];
            markdown = [ "prettier" ];
          };
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters = {
            latexindent = {
              command = "latexindent";
              args = [
                "-m"
                "-"
              ];
            };
          };
        };
      };
    };
  };
}
