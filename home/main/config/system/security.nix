{ ... }:
{
  # gnome keyring
  services.gnome-keyring = {
    enable = true;
    components = [ "secrets" ];
  };
  # gpg keys
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
  };
  # sops secrets management
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  sops.defaultSopsFile = ../../../../secrets/secrets.yaml; # ajustez selon l'emplacement réel de CE fichier
  sops.defaultSopsFormat = "yaml";
  # ssh management
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "gitlab.com" = {
        identityFile = "~/.ssh/id_gitlab";
        identitiesOnly = true;
      };
      "gitea.zaclys.com" = {
        identityFile = "~/.ssh/id_gitea";
        identitiesOnly = true;
      };
      "github.com" = {
        identityFile = "~/.ssh/id_github";
        identitiesOnly = true;
      };
    };
  };
}
