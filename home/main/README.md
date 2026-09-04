# HOME MANAGER
## Présentation
Home Manager permet de gérer le système "par utilisateur". Ici sont entrées les déclarations destinées à un utilisateur particulier (pas system-wide contrairement à ce qui est déclaré dans hosts).

Il existe 2 types de déclarations :
- programs (à privilégier) : permet de configurer directement le programme avec nix
- packages (si programs inexistant) : ne permet pas de configurer, si besoin il faut passer par des dotfiles appelés par le fichier `externalDotfiles`

Ici, je sépare deux types de hosts, pour éviter des installations trop lourdes sur mon laptop. Il y a donc un home-laptop et un home dans lesquels les appels aux programs/packages sont faits.
## Structure
```
├── config
│   ├── code
│   │   ├── python.nix
│   │   └── texlive.nix
│   ├── packages
│   │   ├── packagesLight.nix
│   │   └── packages.nix
│   ├── programs
│   │   ├── others
│   │   │   ├── btop.nix
│   │   │   ├── firefox.nix
│   │   │   ├── mpv.nix
│   │   │   ├── obs.nix
│   │   │   ├── thunderbird.nix
│   │   │   ├── zathura.nix
│   │   │   └── zen.nix
│   │   ├── terminal
│   │   │   ├── kitty.nix
│   │   │   ├── neovim
│   │   │   │   ├── config
│   │   │   │   │   ├── extrafiles.nix
│   │   │   │   │   ├── extrapackages.nix
│   │   │   │   │   ├── extraplugins.nix
│   │   │   │   │   ├── globals.nix
│   │   │   │   │   ├── keymaps.nix
│   │   │   │   │   └── plugins.nix
│   │   │   │   ├── lua
│   │   │   │   │   ├── autocmd.lua
│   │   │   │   │   ├── lsp-config.lua
│   │   │   │   │   ├── remap.lua
│   │   │   │   │   └── settings.lua
│   │   │   │   ├── neovim.nix
│   │   │   │   ├── plugins
│   │   │   │   │   ├── blink-cmp.nix
│   │   │   │   │   ├── conform-nvim.nix
│   │   │   │   │   ├── gitsigns.nix
│   │   │   │   │   ├── lsp.nix
│   │   │   │   │   ├── lualine.nix
│   │   │   │   │   ├── luasnip.nix
│   │   │   │   │   ├── mini.nix
│   │   │   │   │   ├── neogit.nix
│   │   │   │   │   ├── noice.nix
│   │   │   │   │   ├── oil.nix
│   │   │   │   │   ├── snacks.nix
│   │   │   │   │   ├── telescope.nix
│   │   │   │   │   ├── tmux-navigator.nix
│   │   │   │   │   ├── treesitter.nix
│   │   │   │   │   ├── vimtex.nix
│   │   │   │   │   ├── web-devicons.nix
│   │   │   │   │   └── which-key.nix
│   │   │   │   └── snippets
│   │   │   │       ├── matlab.lua
│   │   │   │       └── tex.lua
│   │   │   ├── tmux.nix
│   │   │   └── zsh.nix
│   │   └── window-manager
│   │       ├── mako.nix
│   │       └── niri
│   │           ├── conf
│   │           │   ├── animations.nix
│   │           │   ├── gestures.nix
│   │           │   ├── input.nix
│   │           │   ├── keybind.nix
│   │           │   ├── layer-rules.nix
│   │           │   ├── layout.nix
│   │           │   ├── misc.nix
│   │           │   ├── output.nix
│   │           │   ├── window-rules.nix
│   │           │   └── workspaces.nix
│   │           ├── niri.nix
│   │           └── settings.nix
│   └── system
│       ├── emailAccounts.nix
│       ├── git.nix
│       ├── nextcloud.nix
│       ├── security.nix
│       └── vpnOpenconnect.nix
├── externalDotfiles.nix
├── home-laptop.nix
├── home.nix
├── README.md
└── shared.nix
```
