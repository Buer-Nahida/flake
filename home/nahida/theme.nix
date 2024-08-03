{ pkgs, config, ... }:
let
  nerdfonts = pkgs.nerdfonts.override {
    fonts = [
      "Ubuntu"
      "UbuntuMono"
      "CascadiaCode"
      "FantasqueSansMono"
      "FiraCode"
      "Mononoki"
    ];
  };
  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };
  font = {
    name = "Ubuntu Nerd Font";
    package = nerdfonts;
    size = 11;
  };
  cursorTheme = {
    name = "Qogir";
    size = 24;
    package = pkgs.qogir-icon-theme;
  };
  iconTheme = {
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme;
  };
in {
  home = {
    packages = with pkgs; [
      cantarell-fonts
      font-awesome
      theme.package
      font.package
      cursorTheme.package
      iconTheme.package
      adwaita-icon-theme
      papirus-icon-theme
    ];
    sessionVariables = {
      XCURSOR_THEME = cursorTheme.name;
      XCURSOR_SIZE = "${toString cursorTheme.size}";
    };
    pointerCursor = cursorTheme // { gtk.enable = true; };
    file = {
      ".config/gtk-4.0/gtk.css".text = ''
        window.messagedialog .response-area > button,
        window.dialog.message .dialog-action-area > button,
        .background.csd{
          border-radius: 0;
        }
      '';
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    inherit font cursorTheme iconTheme;
    theme.name = theme.name;
    enable = true;
    gtk3.extraCss = ''
      headerbar, .titlebar,
      .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
        border-radius: 0;
      }
    '';
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
  };

  home.file.".local/share/flatpak/overrides/global".text = let
    dirs = [
      "/nix/store:ro"
      "xdg-config/gtk-3.0:ro"
      "xdg-config/gtk-4.0:ro"
      "${config.xdg.dataHome}/icons:ro"
    ];
  in ''
    [Context]
    filesystems=${builtins.concatStringsSep ";" dirs}
  '';
}
# { config, mypkgs, pkgs, ... }: {
#   home.packages = with pkgs; [ sassc gtk-engine-murrine gnome-themes-extra ];
#
#   catppuccin = {
#     accent = "sky";
#     flavor = "mocha";
#     pointerCursor.enable = true;
#   };
#   # home.pointerCursor.name = "";
#   # home.pointerCursor.package = pkgs.catppuccin-cursors;
#
#   qt = {
#     enable = true;
#     platformTheme.name = "kvantum";
#     style = {
#       name = "kvantum";
#       catppuccin.enable = true;
#     };
#   };
#
#   home.pointerCursor = {
#     gtk.enable = true;
#     x11 = {
#       enable = true;
#       defaultCursor = "left_ptr";
#     };
#   };
#
#   gtk = {
#     enable = true;
#     catppuccin = {
#       enable = false;
#       icon = {
#         enable = true;
#         accent = "sky";
#       };
#     };
#     # theme = {
#     #   package = mypkgs.tokyonight-dark-b-mb;
#     #   name = "Tokyonight-Dark-B-MB";
#     # };
#     font = {
#       package = mypkgs.fonts;
#       name = "FZLanTingYuan-DB-GBK";
#       size = 12;
#     };
#     gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
#   };
#   dconf.settings."org/gnome/desktop/interface" = {
#     color-scheme = "prefer-dark";
#   };
# }
