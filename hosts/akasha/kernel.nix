{
  boot = {
    kernelParams = [ "i915.force_probe=4692" "i915.fastboot=1" ];
    kernelModules = [ "kvm-intel" ];
  };
}
