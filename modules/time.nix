{ options, ... }:
{
  time.timeZone = "Asia/Shanghai";
  networking.timeServers = [
    "0.cn.pool.ntp.org"
    "1.cn.pool.ntp.org"
    "2.cn.pool.ntp.org"
    "3.cn.pool.ntp.org"
    "0.alsa.pool.ntp.org"
    "1.alsa.pool.ntp.org"
    "2.alsa.pool.ntp.org"
    "3.alsa.pool.ntp.org"
    "0.pool.ntp.org"
    "1.pool.ntp.org"
    "2.pool.ntp.org"
    "3.pool.ntp.org"
  ] ++ options.networking.timeServers.default;
}
