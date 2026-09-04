{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    focusEvents = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
        '';
      }
    ];

    extraConfig = ''
      # renuméroter les fenêtres quand l'une d'elles est fermée
      set -g renumber-windows on

      # découpage de panes, mêmes mnémoniques que neovim (splitright/splitbelow)
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # nouvelle fenêtre dans le répertoire courant
      bind c new-window -c "#{pane_current_path}"

      # redimensionner (verbe "resize", palier préfixe+hjkl — comme Ctrl+Alt+hjkl sous niri)
      bind -r h resize-pane -L 5
      bind -r l resize-pane -R 5
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5

      # déplacer un pane (verbe "move", palier préfixe+HJKL — comme Super+hjkl sous niri)
      bind -r H swap-pane -t '{left-of}'
      bind -r L swap-pane -t '{right-of}'
      bind -r J swap-pane -t '{down-of}'
      bind -r K swap-pane -t '{up-of}'

      # rechargement de la config
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux config rechargée"

      # style de statusline minimal (les couleurs sont gérées par stylix)
      set -g status-position top
      set -g status-interval 5
      set -g status-left-length 40
      set -g status-left "#[bold] #S "
      set -g status-right "#{?client_prefix,PREFIX ,}%H:%M "
    '';
  };
}
