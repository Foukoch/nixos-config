# Présentation
Dans hosts sont déclarés :
- les configurations système
- les packages installés system-wide (indépendants des users)
- les services nécessaires
- les configurations machine (générés et récupérés dans `/nix`)

# Structure
```
├── common
│   ├── basesystem
│   │   ├── bluetooth.nix
│   │   ├── language.nix
│   │   ├── secrets.nix
│   │   ├── SPEC_home
│   │   │   ├── boot.nix
│   │   │   ├── drivers_video.nix
│   │   │   ├── memory.nix
│   │   │   ├── power_management.nix
│   │   │   └── system.nix
│   │   ├── SPEC_laptop
│   │   │   ├── boot.nix
│   │   │   ├── drivers_video.nix
│   │   │   ├── memory.nix
│   │   │   ├── power_management.nix
│   │   │   └── system.nix
│   │   ├── system_saves.nix
│   │   └── users.nix
│   ├── niri.nix
│   ├── programs
│   │   ├── SPEC_home
│   │   │   ├── gamescope.nix
│   │   │   ├── phone.nix
│   │   │   └── steam.nix
│   │   └── SPEC_laptop
│   ├── services
│   │   ├── fwupd.nix
│   │   ├── gnome-keyring.nix
│   │   ├── greetd.nix
│   │   ├── gvfs.nix
│   │   ├── mullvad.nix
│   │   ├── openconnect.nix
│   │   ├── protonmail.nix
│   │   ├── sound.nix
│   │   ├── SPEC_home
│   │   │   └── avahi.nix
│   │   ├── SPEC_laptop
│   │   ├── ssh-keys.nix
│   │   └── vpn_travail.nix
│   ├── style
│   │   ├── fonts.nix
│   │   ├── SPEC_home
│   │   ├── SPEC_laptop
│   │   └── stylix.nix
│   ├── system_packages.nix
│   └── wayland.nix
├── nixos-home
│   ├── configuration.nix
│   └── hardware-configuration.nix
├── nixos-laptop
│   ├── configuration.nix
│   └── hardware-configuration.nix
└── README.md
```
