{ config, ... }:
{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
          folding.enable = true;
        };

        # Grammaires pré-compilées par Nix (reproductible, pas de compilation au runtime)
        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          nix
          python
          lua
          latex
          bibtex
          markdown
          markdown_inline
          bash
          json
          yaml
          toml
          vim
          vimdoc
          regex
          query
        ];
      };
    };
  };
}
