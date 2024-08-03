{ dirContents, ... }: {
  imports = dirContents ./. [ ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
