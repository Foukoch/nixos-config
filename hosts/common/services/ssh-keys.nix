{ local, ... }:
{
  sops.secrets = {
    "ssh/gitlab_ed25519" = {
      mode = "0400";
      owner = local.username;
      group = "users";
      path = "/home/${local.username}/.ssh/id_gitlab";
    };
    "ssh/gitea_ed25519" = {
      mode = "0400";
      owner = local.username;
      group = "users";
      path = "/home/${local.username}/.ssh/id_gitea";
    };
    "ssh/github_ed25519" = {
      mode = "0400";
      owner = local.username;
      group = "users";
      path = "/home/${local.username}/.ssh/id_github";
    };
  };
}
