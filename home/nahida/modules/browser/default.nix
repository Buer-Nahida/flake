{ pkgs, inputs, ... }: {
  home.sessionVariables.MOZ_USE_XINPUT2 = 1;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "application/pdf" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
  programs.firefox = let
    Preferences = {
      "gfx.webrender.all" = true;
      "media.ffmpeg.vaapi.enabled" = true;
      "widget.dmabuf.force-enabled" = true;

      "network.http.http3.enabled" = true;
      "browser.toolbars.bookmarks.visibility" = "never";
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "privacy.userContext.enabled" = true;
      "privacy.userContext.ui.enabled" = true;
      "permissions.isolateBy.userContext" = true;
      "svg.context-properties.content.enabled" = true;

      "sidebar.position_start" = false; # Sidebery on right
    };
  in {
    enable = true;
    package = inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;
    languagePacks = [ "zh-CN" ];
    policies = {
      DisplayBookmarksToolbar = true;
      inherit Preferences;
      ExtensionSettings = {
        "*" = {
          allowed_types = [ "extension" "theme" "locale" ];
          default_area = "menupanel";
          install_sources = [ "https://addons.mozilla.org/" ];
          installation_mode = "blocked";
          restricted_domains = [ ];
          updates_disabled = false;
        };
        "firefox@tampermonkey.net" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4282688/tampermonkey-5.1.1.xpi";
        };
        "adguardadblocker@adguard.com" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4294826/adguard_adblocker-4.3.53.xpi";
        };
        "{bbb880ce-43c9-47ae-b746-c3e0096c5b76}" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4305718/catppuccin_gh_file_explorer-0.7.1.xpi";
        };
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4064884/clearurls-1.26.1.xpi";
        };
        "{20fc2e06-e3e4-4b2b-812b-ab431220cada}" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/startpage-private-search.xpi";
        };
        "{3c078156-979c-498b-8990-85f7987dd929}" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4246774/sidebery-5.2.0.xpi";
        };
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4232144/styl_us-1.5.46.xpi";
        };
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4259790/vimium_ff-2.1.2.xpi";
        };
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4290466/ublock_origin-1.58.0.xpi";
        };
        "{5efceaa7-f3a2-4e59-a54b-85319448e305}" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4299644/immersive_translate-1.6.2.xpi";
        };
        "pagesidebar@stefanvd.net" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/4363471/page_sidebar-1.2.7.xpi";
        };
        "{12eeb304-58cd-4bcb-9676-99562b04f066}" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/file/3954372/catppuccin_dark_sky-2.0.xpi";
        };
      };
    };
    profiles.default = {
      settings = Preferences;
      userChrome = builtins.readFile ./userChrome.css;
      userContent = import ./userContent.nix pkgs.linkFarm;
    };
  };
}
