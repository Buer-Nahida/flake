{
  programs = {
    bottom = {
      enable = true;
      catppuccin.enable = true;
      settings.flags = {
        rate = 250;
        enable_gpu_memory = true;
        enable_cache_memory = true;
      };
    };
    btop = {
      enable = true;
      catppuccin.enable = true;
      settings = {
        vim_keys = true;
        update_ms = 250;
        base_10_sizes = true;
        log_level = "DISABLED";
        theme_background = false;
      };
    };
  };
}
