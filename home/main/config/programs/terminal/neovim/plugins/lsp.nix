{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          # Nix
          nixd = {
            enable = true;
            settings = {
              nixpkgs.expr = "import <nixpkgs> { }";
            };
          };
          # Python : basedpyright pour les types/défs, ruff pour le lint (rapide)
          basedpyright.enable = true;
          ruff.enable = true;
          # LaTeX (coexiste très bien avec vimtex)
          texlab = {
            enable = true;
            settings = {
              texlab = {
                build = {
                  onSave = false; # vimtex gère déjà la compilation
                };
                chktex.onOpenAndSave = true;
              };
            };
          };
          # Lua
          lua_ls = {
            enable = true;
            settings.telemetry.enable = false;
          };
          # Markdown
          marksman.enable = true;
        };
        keymaps = {
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };
          lspBuf = {
            gd = "definition";
            gD = "declaration";
            gr = "references";
            gi = "implementation";
            K = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
            "<leader>f" = "format";
          };
        };
      };
    };
  };
}
