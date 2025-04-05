{ realname, email, ... }:
{
  programs = {
    git-credential-oauth.enable = true;
    git = {
      userName = realname;
      userEmail = email;
      signing = {
        signByDefault = true;
        key = "B7CFAB72643B5A6B";
      };
      enable = true;
      lfs.enable = true;
      extraConfig.init.defaultBranch = "main";
      delta = {
        enable = true;
        options.side-by-side = true;
      };
    };
  };
  catppuccin.delta.enable = true;
}
