{ ... }:
{
  imports = [
    # programs
    # others
    ./config/programs/others/btop.nix
    ./config/programs/others/firefox.nix
    ./config/programs/others/mpv.nix
    ./config/programs/others/thunderbird.nix
    ./config/programs/others/zathura.nix
    ./config/programs/others/zen.nix
    # terminal
    ./config/programs/terminal/kitty.nix
    ./config/programs/terminal/tmux.nix
    ./config/programs/terminal/zsh.nix
    ./config/programs/terminal/neovim/neovim.nix
    # WM
    ./config/programs/window-manager/mako.nix
    ./config/programs/window-manager/niri/niri.nix
    # code
    ./config/code/python.nix
    ./config/code/texlive.nix
    # system
    ./config/system/emailAccounts.nix
    ./config/system/git.nix
    ./config/system/nextcloud.nix
    ./config/system/security.nix
    ./config/system/vpnOpenconnect.nix
  ];
}
