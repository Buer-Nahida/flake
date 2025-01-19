{
  catppuccin.bottom.enable = true;
  programs.bottom = {
    enable = true;
    settings.flags = {
      rate = 250;
      enable_gpu_memory = true;
      enable_cache_memory = true;
    };
  };
}
