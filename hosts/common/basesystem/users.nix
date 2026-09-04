{ pkgs, local, ... }:
{
  users.users.afoucaultc = {
    isNormalUser = true;
    description = local.username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}
