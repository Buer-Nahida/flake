{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
