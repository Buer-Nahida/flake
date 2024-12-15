{ pkgs, ... }: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      waveform
      wlrobs
      obs-vkcapture
      obs-vaapi
      input-overlay
    ];
  };
}
