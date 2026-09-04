{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    history = {
      size = 50000;
      save = 50000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      extended = true;
    };

    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -lh";
      la = "ls -lah";
      grep = "grep --color=auto";
      hms = "home-manager switch --flake ~/nixos-config#afoucaultc";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config";
      v = "nvim";
      t = "tmux attach || tmux new";
      lg = "lazygit";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "sudo"
        "tmux"
      ];
    };

    initContent = lib.mkOrder 1000 ''
      # ouvrir tmux automatiquement dans les vrais terminaux (pas dans VS Code, pas en SSH sans tty)
      if [[ -z "$TMUX" && -o interactive && -z "$VSCODE_INJECTION" ]]; then
        tmux attach -t main 2>/dev/null || tmux new -s main
      fi

      # correction de fautes de frappe sur les commandes
      setopt CORRECT
    '';
  };
}
