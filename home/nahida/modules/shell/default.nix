{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    (fortune.overrideAttrs (_: {
      postInstall = ''
        ar x ${
          fetchurl {
            url =
              "http://ftp.cn.debian.org/debian/pool/main/f/fortune-zh/fortunes-zh_2.98_all.deb";
            hash = "sha256-IRxd3uWdCudM4By/0C98hxR0C64YNdVmHrIlTt1zkQU=";
          }
        }
        tar -xvf data.tar.xz
        cp usr/share/games/fortunes/{chinese,chinese.dat,song100,song100.dat,tang300,tang300.dat} $out/share/games/fortunes
      '';
    }))
    lolcat
    zoxide
    eza
    jq
    fzf
    fd
    ripgrep

    # For OMZP::extract
    gnutar
    lz4
    lrzip
    pigz
    pbzip2
    xz
    gzip
    unzip
    unrar
    # rpm # I don't need it
    p7zip
    binutils
    zstd
    cabextract
    cpio
    zpaq
    qpdf
  ];
  programs = {
    zsh = {
      enable = true;
      shellAliases = import ./aliases.nix;
      initExtra = builtins.readFile ./init.zsh;
      envExtra = builtins.readFile ./env;
      dotDir = ".config/zsh";
      history = rec {
        size = 9223372036854775807;
        save = size;
        path = "${config.xdg.dataHome}/zsh/zsh_history";
        ignoreSpace = true;
        ignoreDups = true;
        ignoreAllDups = true;
        share = true;
      };
    };
    yazi.enableZshIntegration = true;
    wezterm.enableZshIntegration = true;
    atuin = {
      enable = true;
      settings.auto_sync = false;
      enableZshIntegration = true;
    };
  };
  xdg.configFile = {
    "zsh/p10k.zsh".source = ./config/p10k.zsh;
    "zsh/github_ssh_agent_autostart.zsh".source =
      ./config/github_ssh_agent_autostart.zsh;
    "zsh/options.zsh".source = ./config/options.zsh;
    "zsh/plugins".source = ./config/plugins;
    "zsh/zstyle.zsh".source = ./config/zstyle.zsh;
  };
}
