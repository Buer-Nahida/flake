{ realname, email, ... }: {
  programs = {
    git-credential-oauth.enable = true;
    git = {
      userName = realname;
      userEmail = email;
      signing = {
        signByDefault = true;
        key = "F6A3F09956C9F243";
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
