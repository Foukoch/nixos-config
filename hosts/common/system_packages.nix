{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    vim
    gnumake
    gnupg
    gcc
    wget
    curl
    unzip
    tree
    ripgrep
    translate-shell
    xclip
    powertop
    brightnessctl
    ntfs3g
    pciutils
    usbutils
    inxi
  ];
}
