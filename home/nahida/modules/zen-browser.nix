{
  inputs,
  pkgs,
  ...
}:
{
  home.sessionVariables = {
    MOZ_X11_EGL = 1;
    MOZ_USE_XINPUT2 = 1;
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen.desktop";
      "application/pdf" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
    };
  };
  home.packages = [
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
