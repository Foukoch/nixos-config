# How to use
## Raccourcis utiles
```
Lancer start-hyprland dans le tty au démarrage

ALT Q : ouvre le terminal
ALT N : ouvre neovim
ALT W : ouvre le sélecteurs de programmes
ALT X : ouvre le sélecteur de fenêtre
ALT C : ouvre le sélecteur de dossier
ALT D : ouvre le gestionnaire de fichiers

MAJ L ou H : change de workspace à droite ou à gauche
MAJ K ou J : envoie la fenêtre courante dans le workspace à droite ou à gauche

Pour le reste, se référer aux dotfiles ~/nixos-config/dotfiles/hypr/conf/binding.lua
```
## Structure :
```
├── dotfiles
│   ├── inkscape
│   │   ├── palettes -> /nix/store/9k8snmg0j8z7vk3v64n3h4md139kn7hl-home-manager-files/.config/inkscape/palettes
│   │   ├── palettes.backup
│   │   │   ├── palette.gpl
│   │   │   └── template_latex.svg
│   │   ├── templates -> /nix/store/9k8snmg0j8z7vk3v64n3h4md139kn7hl-home-manager-files/.config/inkscape/templates
│   │   └── templates.backup
│   │       ├── default.svg
│   │       └── LaTeX_modele.svg
│   ├── rofi
│   │   ├── config.rasi
│   │   ├── tokyonight_big1.rasi
│   │   ├── tokyonight_big2.rasi
│   │   └── tokyonight.rasi
│   └── wallpaper
│       └── nix-wallpaper.png
├── flake.lock
├── flake.nix
├── home
│   └── main
│       ├── config
│       │   ├── code
│       │   │   ├── python.nix
│       │   │   └── texlive.nix
│       │   ├── packages
│       │   │   ├── packagesLight.nix
│       │   │   └── packages.nix
│       │   ├── programs
│       │   │   ├── others
│       │   │   │   ├── btop.nix
│       │   │   │   ├── firefox.nix
│       │   │   │   ├── mpv.nix
│       │   │   │   ├── obs.nix
│       │   │   │   ├── thunderbird.nix
│       │   │   │   ├── zathura.nix
│       │   │   │   └── zen.nix
│       │   │   ├── terminal
│       │   │   │   ├── kitty.nix
│       │   │   │   ├── neovim
│       │   │   │   │   ├── config
│       │   │   │   │   │   ├── extrafiles.nix
│       │   │   │   │   │   ├── extrapackages.nix
│       │   │   │   │   │   ├── extraplugins.nix
│       │   │   │   │   │   ├── globals.nix
│       │   │   │   │   │   ├── keymaps.nix
│       │   │   │   │   │   └── plugins.nix
│       │   │   │   │   ├── lua
│       │   │   │   │   │   ├── autocmd.lua
│       │   │   │   │   │   ├── lsp-config.lua
│       │   │   │   │   │   ├── remap.lua
│       │   │   │   │   │   └── settings.lua
│       │   │   │   │   ├── neovim.nix
│       │   │   │   │   ├── plugins
│       │   │   │   │   │   ├── blink-cmp.nix
│       │   │   │   │   │   ├── conform-nvim.nix
│       │   │   │   │   │   ├── gitsigns.nix
│       │   │   │   │   │   ├── lsp.nix
│       │   │   │   │   │   ├── lualine.nix
│       │   │   │   │   │   ├── luasnip.nix
│       │   │   │   │   │   ├── mini.nix
│       │   │   │   │   │   ├── neogit.nix
│       │   │   │   │   │   ├── noice.nix
│       │   │   │   │   │   ├── oil.nix
│       │   │   │   │   │   ├── snacks.nix
│       │   │   │   │   │   ├── telescope.nix
│       │   │   │   │   │   ├── tmux-navigator.nix
│       │   │   │   │   │   ├── treesitter.nix
│       │   │   │   │   │   ├── vimtex.nix
│       │   │   │   │   │   ├── web-devicons.nix
│       │   │   │   │   │   └── which-key.nix
│       │   │   │   │   └── snippets
│       │   │   │   │       ├── matlab.lua
│       │   │   │   │       └── tex.lua
│       │   │   │   ├── tmux.nix
│       │   │   │   └── zsh.nix
│       │   │   └── window-manager
│       │   │       ├── mako.nix
│       │   │       └── niri
│       │   │           ├── conf
│       │   │           │   ├── animations.nix
│       │   │           │   ├── gestures.nix
│       │   │           │   ├── input.nix
│       │   │           │   ├── keybind.nix
│       │   │           │   ├── layer-rules.nix
│       │   │           │   ├── layout.nix
│       │   │           │   ├── misc.nix
│       │   │           │   ├── output.nix
│       │   │           │   ├── window-rules.nix
│       │   │           │   └── workspaces.nix
│       │   │           ├── niri.nix
│       │   │           └── settings.nix
│       │   └── system
│       │       ├── emailAccounts.nix
│       │       ├── git.nix
│       │       ├── nextcloud.nix
│       │       ├── security.nix
│       │       └── vpnOpenconnect.nix
│       ├── externalDotfiles.nix
│       ├── home-laptop.nix
│       ├── home.nix
│       ├── README.md
│       └── shared.nix
├── hosts
│   ├── common
│   │   ├── basesystem
│   │   │   ├── bluetooth.nix
│   │   │   ├── language.nix
│   │   │   ├── secrets.nix
│   │   │   ├── SPEC_home
│   │   │   │   ├── boot.nix
│   │   │   │   ├── drivers_video.nix
│   │   │   │   ├── memory.nix
│   │   │   │   ├── power_management.nix
│   │   │   │   └── system.nix
│   │   │   ├── SPEC_laptop
│   │   │   │   ├── boot.nix
│   │   │   │   ├── drivers_video.nix
│   │   │   │   ├── memory.nix
│   │   │   │   ├── power_management.nix
│   │   │   │   └── system.nix
│   │   │   ├── system_saves.nix
│   │   │   └── users.nix
│   │   ├── niri.nix
│   │   ├── programs
│   │   │   └── SPEC_home
│   │   │       ├── gamescope.nix
│   │   │       ├── phone.nix
│   │   │       └── steam.nix
│   │   ├── services
│   │   │   ├── fwupd.nix
│   │   │   ├── gnome-keyring.nix
│   │   │   ├── greetd.nix
│   │   │   ├── gvfs.nix
│   │   │   ├── mullvad.nix
│   │   │   ├── openconnect.nix
│   │   │   ├── protonmail.nix
│   │   │   ├── sound.nix
│   │   │   ├── SPEC_home
│   │   │   │   └── avahi.nix
│   │   │   ├── ssh-keys.nix
│   │   │   └── vpn_travail.nix
│   │   ├── style
│   │   │   ├── fonts.nix
│   │   │   └── stylix.nix
│   │   ├── system_packages.nix
│   │   └── wayland.nix
│   ├── nixos-home
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   ├── nixos-laptop
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── README.md
├── install.sh
├── LICENSE
├── local_exemple.nix
├── README.md
├── rebuild.sh
├── secrets
│   └── secrets.yaml
└── update.sh```

## Installation :
1. Installer NixOS sur clé USB (via Rufus sous windows par exemple)
2. Boot sur clé USB
3. Suivre les indications (perso: chiffrement LUKS + swap activé + formatage auto)
4. Reboot dans NixOS sur la machine (pas sur la clé USB !)
5. Cloner le repo git en utilisant git temporairement via nix shell : `nix-shell -p git --run "git clone https://gitlab.com/afoucaultc/nixos-config.git ~/nixos-config"`
6. Lancer le `./install` (copie hardware-configuration dans le host, ajoute le host et les fichiers de config, lance un rebuild)
7. C'est fini, reboot et lancer la nouvelle version avec Grub

> [!WARNING]
> Il peut y avoir besoin d'ajouter un utilisateur pour git, à voir par la suite

> [!NOTE]
> Pour les GPU ou CPU spécifiques, des changements peuvent être nécessaires, il faut adapter le host
> L'installation en ligne de commande n'est pas traitée ici, mais peut être indispensable pour une vieille machine. Perso, j'ai eu des soucis parce que j'ai installé avec l'utilisateur sudo, puis ai dû tout migrer vers un nouvel utilisateur créé après réinstallation (et me connecter la première fois avec sudo)

## Installer un nouveau package et mettre à jour
### Pour update
```nix
nix flake update
sudo nixos-rebuild switch --flake ~/nixos-config#nixos-home 
```
Ou utiliser `update.sh`

Il est possible de mettre à jour la config sans mettre à jour tous les packages, en utilisant `rebuild.sh`

### Pour trouver un nouveau package :
```nix
nix search nixpkgs nom_du_package
```
### Pour savoir où le déclarer :
1. system wide : dans hosts
2. user-level : dans home
### Pour savoir comment le déclarer :
1. Avec un module `programs.*` s'il existe (à préférer, voir [lien](https://home-manager-options.extranix.com/))
2. Avec `home.packages` (`home.packages = [ pkgs.xxx ];`)
### Pour gérer la version
1. version trop ancienne : référencer `pkgs-unstable.xxx`
2. Package pas encore dans nixpkgs : chercher un flake upstream officiel (packages.<system>.degault), ajouter comme input et le référencer
### Machine ancienne
Bien utiliser la version `laptop` qui prend la plupart des paquets par cachix (pour éviter la compilation en locale qui dépasse les capacités de la RAM)

# Configuration secrets et mails
## Configuration clés de chiffrement pour secrets
> [!NOTE]
> l'utilisation de sops permet de stocker sur git des mot de passe ou fichiers cryptés grâce à des clés conservées localement. Nix est donc capable grâce à ces clés de décrypter et utiliser les login adéquats

0. Créer les bons fichiers/dossiers
```bash
sudo mkdir -p /var/lib/sops.nix # pour la clé machine
mkdir -p ~/.config/sops/age # pour la clé perso
```
1. Récupérer la clé privée personnelle sur bitwarden et la stocker dans `.config`
```bash
nix shell nixpkgs#age -c age-keygen -o ~/.config/age/keys.txt
# puis éditer ~/.config/age/keys.txt et remplacer par ce qui est dans bitwarden
```
2. Générer une clé machine
```bash
nix shell nixpkgs#age -c age-keygen -o /tmp/age-key.txt
sudo mv /tmp/age-key.txt /var/lib/sops-key.txt
sudo chmod 600 /var/lib/sops-nix/key.txt
```
3. Récupérer les clés publiques et éditer `nixos-config/.sops.yaml` (ajouter un host ou user si besoin)
```bash
sudo nix shell nixpkgs#age -c age-keygen -y /var/lib/sops-key.txt
sudo nix shell nixpkgs#age -c age-keygen -y ~/.config/age/keys.txt
```
4. Ajouter/éditer un ou des secrets si besoin
```bash
nix shell nixpkgs#sops --command sops secrets/secrets.yaml
```
5. Mettre à jour les clés
```bash
nix shell nixpkgs#sops --command sops updatekeys secrets/secrets.yaml
```

## Configuration adresse protonmail
> [!NOTE]
> Proton mail est particulier car il nécessite une authentification par un portail local (protonmail-bridge). Il faut suivre le processus prévu par Proton pour mettre en place le bridge qui s'occupera de décrypter les mails en local

1. Couper le cli protonmail : `systemctl --user stop protonmail-bridge`
2. Ouvrir le bridge et suivre les opérations : 
```bash
protonmail-bridge --cli
>>> connect
>>> ... <se connecter puis attendre la fin de sync>
>>> info
>>> ... <récupérer mdp et adresses>
```
3. Une fois le mot de passe récupérer, le mettre à jour dans `secrets/secrets.yaml`
```bash
cd ~/nixos-config/
nix shell nixpkgs#sops --command sops secrets/secrets.yaml
# changer le mdp ou ajouter une nouvelle machine, puis sauvegarder
nix shell nixpkgs#sops --command sops updatekeys secrets/secrets.yaml
```
4. Noter le bon nom du mdp dans `home/main/packages/mail-accounts.nix` au niveau de `sops.secrets."mail/<nomDuMdp>"`

## Remplir le local.nix
```bash
cd nixos-config
mkdir ../personal-info
cp local_exemple.nix ../personal-info/local.nix
vi ../personal-info/local.nix
```
Et changer avec les noms adéquats
