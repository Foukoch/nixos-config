{ pkgs, local, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    settings = {
      user.name = local.username;
      user.email = local.gitEmail;

      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      fetch.prune = true;
      rebase.autoStash = true;

      core.editor = "nvim";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";

      alias = {
        st = "status -sb";
        co = "checkout";
        br = "branch";
        lg = "log --oneline --graph --decorate --all";
        last = "log -1 HEAD";
        amend = "commit --amend --no-edit";
        undo = "reset HEAD~1 --mixed";
      };
    };

    ignores = [
      "*.swp"
      ".DS_Store"
      "__pycache__/"
      "*.pyc"
      ".direnv/"
      ".envrc"
      "result"
      "result-*"
    ];
  };

  programs.delta = {
    enable = true;
    options = {
      navigate = true;
      line-numbers = true;
      side-by-side = true;
    };
  };
}
