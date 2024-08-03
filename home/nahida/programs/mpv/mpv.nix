{
  vo = "gpu-next";
  hwdec = "auto"; # 设置硬解api，auto/auto-copy/no 对应 自动/自动-拷回内存/软解
  gpu-api = "vulkan"; # 渲染使用的api，可选auto/d3d11/opengl/vulkan
  hwdec-codecs = "all"; # 尝试使用硬解的格式(默认h264,vc1,hevc,vp8,vp9,AV1；all是特殊值指全部格式)

  cache = true; # 开启缓存
  demuxer-max-bytes = "64MiB"; # 最大缓存大小（KiB或MiB）
  cache-on-disk = false; # 用内存而不是磁盘缓存

  fullscreen = true;
  keepaspect-window = true; # 窗口保持视频比例

  osd-bar-w = 100; # osd-bar宽度[1,100],屏幕宽度的百分比
  osd-bar-h = 0.4; # osd-bar高度[0.1,50]屏幕高度的百分比
  osd-bar-align-y = 1; # 位置[-1,1]x为左到右，y为上到下
  osd-bar-border-size = 0; # osd-bar边框宽度
  osd-color = "#a6e3a1"; # OSD颜色，ARGB16进制表示
  #OSD信息位置、字体大小、边界大小(x横向左中右left/center/right,y纵向上中下top/center/buttom)
  osd-align-x = "left";
  osd-align-y = "top";
  osd-font-size = 22;
  osd-border-size = 2;
  osd-duration = 2000; # 设置OSD文本信息的持续时间（毫秒）（默认值：1000）
  osd-scale-by-window = true; # OSD随窗口大小缩放

  vf = "format:dolbyvision=yes";
  icc-profile-auto = true; # 色彩管理
  video-sync = "display-resample"; # 视频同步
  interpolation = true;
  audio-pitch-correction = true; # 变速播放时的音调修正
  sub-auto = "fuzzy"; # 加载含有视频文件名的全部字幕文件
  audio-file-auto = "fuzzy"; # 加载含有视频文件名的音频文件
  sub-font-size = 44; # 字体大小，默认55，此值是以高度为720的屏幕为比例，更大或更小的屏幕会缩放
  sub-font = "sans-serif"; # 未指定样式的字幕字体
  sub-border-size = 2; # 未指定样式的字幕边框
  sub-ass-force-margins = false; # 不强制外挂ass字幕可使用黑边
  alang = [ "zh" "chs" "sc" "zh-hans" "chi" "en" "eng" ]; # 指定优先使用音轨
  slang = [ "zh" "chs" "sc" "zh-hans" "chi" "en" "eng" ]; # 指定优先使用字幕轨
  loop-playlist = "inf"; # 列表播放循环方式，N|inf|no，循环N次/一直循环/不循环
  volume = 100; # 启动默认音量
  volume-max = 100; # 程序最大音量[100,1000]
  screenshot-format = "png"; # 截屏文件格式（可选：jpg、jpeg、png、webp、jxl）
  screenshot-directory = "~~/Pictures/mpv"; # 截屏文件保存目录

  save-position-on-quit = true; # 退出时记住播放状态（包括是否暂停、音量、播放速度、位置等）
  watch-later-directory = "~~/.cache/mpv/watch-later"; # 播放状态保存目录
  watch-later-options-remove =
    "pause"; # 不记录是否暂停（除了pause同理可写fullscreen,mute,speed,ontop等参数）
  no-input-builtin-bindings = true; # 禁用内置快捷键方案，builtin与default相比不影响脚本的预设快捷键
  osc = false; # 关闭简易控制面板On Screen Controller(osc)
  load-stats-overlay = false; # 禁用内建stats.lua脚本
}
