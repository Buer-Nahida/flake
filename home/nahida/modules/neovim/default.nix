{ lib, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      python3 # for hererocks
      lazygit # for `gg` and `gG` keymaps
      gnumake # for telescope-fzf-native.nvim
      xdg-utils # for `gx` keymap
      nodePackages_latest.prettier # for `formatting.prettier`
      nodePackages_latest.npm # for mason.nvim
      # for nvim-treesitter
      gcc
      curl
      # for telescope.nvim
      fd
      ripgrep
      # for lua
      lua-language-server
      stylua
      shfmt # for sh
      tailwindcss-language-server # for css
      github-cli # for octo.nvim
      # for `lang.*`
      vscode-langservers-extracted # # json
      astro-language-server # # astro
      ## markdown
      marksman
      markdownlint-cli2
      nur.repos.etu.github-markdown-toc
      ## nix
      nil
      nixfmt-classic
      ## rust
      vscode-extensions.vadimcn.vscode-lldb
      rust-analyzer
      rustfmt
      taplo # # toml
      yaml-language-server # # yaml
      # typescript
      typescript
      (vscode-js-debug.overrideAttrs
        (_: { meta.mainProgram = "js-debug-adapter"; }))
    ];
    plugins = with pkgs.vimPlugins; [ lazy-nvim ];
    extraLuaConfig = let
      plugins = with pkgs.vimPlugins; [ codeium-nvim markdown-preview-nvim ];
      mkEntryFromDrv = drv:
        if lib.isDerivation drv then {
          name = "${lib.getName drv}";
          path = drv;
        } else
          drv;
      lazyPath =
        pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
    in ''
      local lazyconf = require("plugins.lazy")
      lazyconf.dev = {
        path = "${lazyPath}",
        patterns = { "." },
        fallback = true,
      }
      require("lazy").setup(lazyconf)
    '';
  };

  xdg.configFile."nvim/lua".source = ./lua;
}
