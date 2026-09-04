{
  description = "My Nixos";
  inputs = {
    # all nix packages (version unstable)
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    # flake niri (git version
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # zen browser (communautaire) — follows pour partager les libs système
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    # stylix
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # gestion déclarative des secrets (age/sops)
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # ici :
  # - inputs@ capture l'ensemble des inputs dans une variable "inputs" accessible par
  # 	"specialArgs" et "extraSpecialArgs". inputs.hyprland pourra être utilisé dans n'importe
  # 	quel fichier importé sans avoir à redéclarer dans flake.nix
  # - ajouter dans la ligne d'outputs les nouveaux packages ajoutés en input !
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      niri,
      nixos-hardware,
      zen-browser,
      stylix,
      nixvim,
      sops-nix,
      ...
    }:
    let
        # récupération de la variable user
      realUser =
        let
          sudoUser = builtins.getEnv "SUDO_USER";
        in
        # si lancement sans sudo
        if sudoUser != "" then sudoUser else builtins.getEnv "USER";
      local = import "/home/${realUser}/.personal-info/local.nix";
    in
    # pour la configuration nixos-home
    {
      nixosConfigurations.nixos-home = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs local; };
        modules = [
          { nixpkgs.hostPlatform = "x86_64-linux"; }
          ./hosts/nixos-home/configuration.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          niri.nixosModules.niri
          sops-nix.nixosModules.sops
          {
            home-manager = {
              # default config
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs local; };
              sharedModules = [
                sops-nix.homeManagerModules.sops
              ];
              # emplacement de la config
              # users.afoucaultc = import ./home/afoucaultc/home.nix;
              users.${local.username} = import ./home/main/home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };

      # pour la configuration home-laptop
      nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs local; };
        modules = [
          { nixpkgs.hostPlatform = "x86_64-linux"; }
          ./hosts/nixos-laptop/configuration.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          niri.nixosModules.niri
          sops-nix.nixosModules.sops
          {
            # default config
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs local; };
              sharedModules = [
                sops-nix.homeManagerModules.sops
              ];
              # emplacement de la config
              users.${local.username} = import ./home/main/home-laptop.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
