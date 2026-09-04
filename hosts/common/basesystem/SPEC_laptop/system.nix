{ ... }:
{
  networking = {
    hostName = "nixos-laptop";
    networkmanager.enable = true;
    firewall.enable = true;
  };
  services = {
    xserver.xkb = {
      layout = "fr";
      variant = "";
    };
    printing.enable = true;
    openssh.enable = false;
    flatpak.enable = true;
    fprintd.enable = true;
  };
  virtualisation.docker.enable = true;
}
