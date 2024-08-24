linkFarm:
let
  firefox-assets' = [ "logo.png" "bg.png" ];
  firefox-assets = linkFarm "firefox-assets" (builtins.map (name: {
    inherit name;
    path = ./${name};
  }) firefox-assets');
in ''
  * {
    font-family: JetBrainsMono Nerd Font Mono;
  }

  @-moz-document url-prefix("about:") {
    :root {
      --in-content-page-background: #1E1E2E !important;
    }
  }

  @-moz-document url-prefix(about:home), url-prefix(about:newtab) {
    /* show nightly logo instead of default firefox logo in newtabpage */
    .search-wrapper .logo-and-wordmark .logo {
      background: url("${firefox-assets}/logo.png") no-repeat center !important;
      background-size: auto !important;
      background-size: 82px !important;
      display: inline-block !important;
      height: 82px !important;
      width: 82px !important;
    }

    body {
        background-color: #000000 !important;
        background: url("${firefox-assets}/bg.png") no-repeat fixed !important;
        background-size: cover !important;
        --newtab-background-color: #000000 !important;
        --newtab-background-color-secondary: #101010 !important;
    }

    body[lwt-newtab-brighttext] {
        --newtab-background-color: #000000 !important;
        --newtab-background-color-secondary: #101010 !important;
    }

    .top-site-outer .top-site-icon {
        background-color: transparent !important;
    }

    .top-site-outer .tile {
        background-color: rgba(49, 49, 49, 0.4) !important;
    }

    .top-sites-list:not(.dnd-active) .top-site-outer:is(.active, :focus, :hover) {
        background: rgba(49, 49, 49, 0.3) !important;
    }

    .top-site-outer .context-menu-button:is(:active, :focus) {
        background-color: transparent !important;
    }

    .search-wrapper .search-handoff-button{
        border-radius: 40px !important;
        background-color: rgba(49, 49, 49, 0.4) !important;
    }
  }
''
