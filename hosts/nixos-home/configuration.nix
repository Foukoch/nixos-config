{ inputs, ... }:
{
  imports = [
    # généré à l'installation avec nixos-generate-config
    # à copier dans le dossier courant depuis /etc/nixos
    ./hardware-configuration.nix
    # ensemble de packages et configurations système
    ../common/basesystem/bluetooth.nix
    ../common/basesystem/language.nix
    ../common/basesystem/secrets.nix
    ../common/basesystem/system_saves.nix
    ../common/basesystem/users.nix
    ../common/basesystem/SPEC_home/boot.nix
    ../common/basesystem/SPEC_home/drivers_video.nix
    ../common/basesystem/SPEC_home/memory.nix
    ../common/basesystem/SPEC_home/power_management.nix
    ../common/basesystem/SPEC_home/system.nix
    # style
    ../common/style/fonts.nix
    ../common/style/stylix.nix
    # additional services
    ../common/services/fwupd.nix
    ../common/services/gnome-keyring.nix
    ../common/services/greetd.nix
    ../common/services/gvfs.nix
    ../common/services/mullvad.nix
    ../common/services/openconnect.nix
    ../common/services/protonmail.nix
    ../common/services/sound.nix
    ../common/services/ssh-keys.nix
    ../common/services/vpn_travail.nix
    ../common/services/SPEC_home/avahi.nix
    # programs
    ../common/programs/SPEC_home/gamescope.nix
    ../common/programs/SPEC_home/steam.nix
    ../common/programs/SPEC_home/phone.nix
    # packages & others
    ../common/niri.nix
    ../common/wayland.nix
    ../common/system_packages.nix
    # profil nixos pour mon ordi portable maison
    # nécessite l'input nixos-hardware dans flake.nix.
    inputs.nixos-hardware.nixosModules.common-cpu-intel # active le microcode intel, KMS pour GPU intégré, etc...
    inputs.nixos-hardware.nixosModules.common-pc-laptop # active tlp
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd # active le TRIM périodique pour le SSD
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  # ne pas toucher, défini une seule fois en fonction de la version de nixos de l'ISO pour la 1ère installation
  system.stateVersion = "25.11";
  # nécessaire pour permettre des dépendances problématiques parfois
  nixpkgs.overlays = [
    (final: prev: {
      streamlink = prev.streamlink.overridePythonAttrs (old: {
        doCheck = false;
      });
    })
  ];
}
