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
    ../common/basesystem/SPEC_laptop/boot.nix
    ../common/basesystem/SPEC_laptop/drivers_video.nix
    ../common/basesystem/SPEC_laptop/memory.nix
    ../common/basesystem/SPEC_laptop/power_management.nix
    ../common/basesystem/SPEC_laptop/system.nix
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
    # packages & others
    ../common/niri.nix
    ../common/wayland.nix
    ../common/system_packages.nix
    # nécessite l'input nixos-hardware dans flake.nix
    inputs.nixos-hardware.nixosModules.common-cpu-intel # active le microcode intel
    inputs.nixos-hardware.nixosModules.common-pc-laptop # active tlp
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  # ne pas toucher, défini une seule fois en fonction de la version de nixos de l'ISO pour la 1ère installation
  system.stateVersion = "25.11";
}
