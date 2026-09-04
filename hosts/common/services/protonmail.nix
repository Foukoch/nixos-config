{ pkgs, ... }:

{
  services.protonmail-bridge = {
    enable = true;
  };

  systemd.user.services.protonmail-bridge = {
    after = [ "gnome-keyring.service" ];
    wants = [ "gnome-keyring.service" ];
    serviceConfig = {
      ExecStartPre = "${pkgs.bash}/bin/bash -c 'until ${pkgs.systemd}/bin/busctl --user list | grep -q org.freedesktop.secrets; do sleep 1; done'";
      RestartSec = "10s";
    };
  };
}
