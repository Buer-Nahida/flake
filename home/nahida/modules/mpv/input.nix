{
  MBTN_LEFT = "cycle pause"; # 左键 切换暂停
  MBTN_RIGHT = "ignore"; # 右键 无操作
  BS = "script-binding playlistmanager/showplaylist"; # 中键 开关增强播放列表
  MBTN_BACK = "playlist-prev"; # 侧键向前 播放列表上一个
  MBTN_FORWARD = "playlist-next"; # 侧键向后 播放列表下一个
  WHEEL_UP = "add volume 2"; # 滚轮向上 音量+2
  WHEEL_DOWN = "add volume -2"; # 滚轮向下 音量-2
  WHEEL_LEFT = "seek 2"; # 滚轮向左 向前2秒
  WHEEL_RIGHT = "seek -2"; # 滚轮向右 向后2秒

  ESC = "set fullscreen no;set window-maximized no"; # ESC 退出全屏
  SPACE = "cycle pause"; # 空格 切换暂停
  ENTER = "cycle fullscreen"; # 回车 切换全屏
  KP_ENTER = "cycle fullscreen"; # 小键盘回车 切换全屏

  UP = "add volume 5"; # 方向键上 音量+5
  DOWN = "add volume -5"; # 方向键下 音量-5
  "Shift+UP" = "add volume  10"; # 音量+10
  "Shift+DOWN" = "add volume -10"; # 音量-10
  LEFT = "seek -5 exact"; # 方向键左 后退5秒
  RIGHT = "seek  5 exact"; # 方向键右 前进5秒
  "Shift+LEFT" = "seek -90"; # 后退90秒
  "Shift+RIGHT" = "seek 87"; # 前进87秒
  "ALT+UP" = "add audio-delay -0.1"; # 音频延迟-0.1
  "ALT+DOWN" = "add audio-delay +0.1"; # 音频延迟+0.1
  "ALT+LEFT" = "add sub-delay -0.1"; # 字幕延迟-0.1
  "ALT+RIGHT" = "add sub-delay 0.1"; # 字幕延迟+0.1

  PGUP = "playlist-prev"; # 播放列表上一个
  PGDWN = "playlist-next"; # 播放列表下一个
  HOME = "add chapter -1"; # 上一章节
  END = "add chapter 1"; # 下一章节
  F1 = "script-binding recent/display-recent"; # 播放历史脚本
  F2 = "script-binding file-browser/open-browser"; # 文件浏览脚本
  F3 = "script-binding playlistmanager/showplaylist"; # 播放列表脚本
  F5 = ''load-script "~~home/thumbfast.lua";show-text "载入略缩图脚本"'';
  F6 = "vf toggle fps=fps=60:round=down"; # 滤镜60帧播放ass弹幕
  F9 = "show-text \${track-list}"; # 显示轨道
  F10 = ''playlist-shuffle; show-text "playlist-shuffle"''; # 乱序播放列表
  INS = "script-message-to console type \"loadfile '';keypress ESC\" 11";
  DEL = "script-message-to console type \"playlist-play-index '';keypress ESC\" 22"; # 序号从0开始

  z = "set speed 1.0"; # 播放速度设为1
  Z = "set speed 2.5"; # 播放速度设为2.5
  x = "add speed -0.1"; # 播放速度-0.1
  c = "add speed 0.1"; # 播放速度+0.1
  X = "multiply speed 0.5"; # 播放速度x0.5
  C = "multiply speed 2.0"; # 播放速度x2
  v = "frame-back-step"; # 前一帧
  b = "frame-step"; # 后一帧
  V = "sub-seek -1"; # 上一条字幕
  B = "sub-seek 1"; # 下一条字幕
  n = "add sub-pos -1"; # 字幕上移1单位
  m = "add sub-pos +1"; # 字幕下移1单位
  "," = "add sub-scale -0.05"; # 字幕缩小5%
  "." = "add sub-scale +0.05"; # 字幕放大5%
  "/" = "set sub-pos 100;set sub-scale 1;set audio-delay 0;set sub-delay 0"; # 复原字幕位置&大小&延迟 与 音频延迟

  a = "cycle audio"; # 切换音轨
  s = "cycle sub"; # 切换字幕轨
  d = "cycle sub-visibility"; # 切换字幕开/关
  f = "cycle mute"; # 静音开/关
  g = "cycle ontop"; # 切换置顶
  G = "cycle border"; # 切换无边框
  H = ''cycle-values hwdec "auto" "no"''; # 切换硬解软解
  j = "cycle deinterlace"; # 切换反交错
  k = ''cycle-values video-aspect-override "16:9" "4:3" "2.35:1" "-1"''; # 循环视频比例
  l = "ab-loop"; # 设置/清除 A-B loop点
  K = "cycle-values loop-file inf no"; # 切换文件循环
  L = "cycle-values loop-playlist inf no"; # 切换列表循环
  ";" = "script-binding modernf/visibility"; # 循环OSC可视性（常驻、隐藏、自动）
  "'" = ''cycle-values osd-level "1" "2" "3"''; # 切换OSD等级

  TAB = "script-binding stats/display-stats-toggle"; # 切换统计信息，可1234翻页
  q = "add brightness -1"; # 亮度-1
  w = "add brightness 1"; # 亮度+1
  e = "add contrast -1"; # 对比度-1
  r = "add contrast 1"; # 对比度+1
  t = "add gamma -1"; # 伽马-1
  y = "add gamma 1"; # 伽马+1
  u = "add saturation -1"; # 饱和度-1
  i = "add saturation 1"; # 饱和度+1
  o = "add hue -1"; # 色调-1
  p = "add hue 1"; # 色调+1
  "[" =
    ''set contrast 0; set brightness 0; set gamma 0; set saturation 0; set hue 0;show-text "视频均衡器归零"''; # 视频均衡器归零
  "]" =
    ''show-text "速度=''${speed} 置顶=''${ontop} 字幕延迟=''${sub-delay}  音频延迟=''${audio-delay}   单循环=''${loop-file}  全循环=''${loop-playlist}  亮度=''${brightness}  对比度=''${contrast}  伽马=''${gamma}  饱和度=''${saturation}  色调=''${hue}"''; # 显示状态信息
  "\\" = "show-progress"; # 显示播放进度

  "`" = "script-binding console/enable"; # 打开控制台，ESC退出
  "1" = "set window-scale 0.333"; # 设置窗口为视频原输出0.333倍
  "2" = "set window-scale 0.667"; # 设置窗口为视频原输出0.667倍
  "3" = "set window-scale 1.0"; # 设置窗口为视频原输出大小
  "4" = "add current-window-scale -0.1"; # 缩小窗口
  "5" = "add current-window-scale  0.1"; # 放大窗口
  "6" = "add video-zoom -0.01"; # 缩小视频(log2对数比例)
  "7" = "add video-zoom 0.01"; # 放大视频
  "8" = "add panscan -0.1"; # 减少裁剪
  "9" = "add panscan 0.1"; # 裁剪视频减少黑边
  "0" = ''cycle-values "!reverse" video-rotate "no" "90" "180" "270"''; # 反向 不旋转/90/180/270

  # 调整视频对齐位置
  "ALT+a" = "add video-align-x -0.1";
  "ALT+d" = "add video-align-x 0.1";
  "ALT+s" = "add video-align-y -0.1";
  "ALT+w" = "add video-align-y 0.1";

  "-" = "set video-zoom 0; set panscan 0; set video-align-x 0; set video-align-y 0"; # 重设缩放\裁剪\位置
  "+" = "screenshot window"; # 带界面（OSC/OSD）截图
  "=" = "screenshot video"; # 视频截图

  # 着色器
  "CTRL+`" = ''no-osd change-list glsl-shaders clr ""; show-text "GLSL shaders cleared"''; # 清除着色器
  "CTRL+1" =
    ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl;~~/shaders/Anime4K_Restore_CNN_S.glsl;~~/shaders/Anime4K_Upscale_CNN_x2_S.glsl;~~/shaders/Anime4K_AutoDownscalePre_x2.glsl;~~/shaders/Anime4K_AutoDownscalePre_x4.glsl;~~/shaders/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode A- (Fast)"'';
  "CTRL+2" =
    ''no-osd change-list glsl-shaders add "~~/shaders/Anime4K_Thin_HQ.glsl";show-text "Anime4K_Thin_HQ" '';
  "CTRL+3" =
    ''no-osd change-list glsl-shaders add "~~/shaders/KrigBilateral.glsl";show-text "KrigBilateral"'';
  "CTRL+4" = ''no-osd change-list glsl-shaders add "~~/shaders/FSR.glsl";show-text "AMD FSR"'';
  "CTRL+5" =
    ''no-osd change-list glsl-shaders add "~~/shaders/CAS-scaled.glsl";show-text "AMD CAS-scaled"'';
  "CTRL+6" = ''no-osd change-list glsl-shaders add "~~/shaders/CAS.glsl";show-text "AMD CAS"'';
  "CTRL+7" = ''no-osd change-list glsl-shaders add "~~/shaders/NVScaler.glsl";show-text "NVScaler"'';
  "CTRL+8" =
    ''no-osd change-list glsl-shaders add "~~/shaders/NVSharpen.glsl";show-text "NVSharpen"'';
  "CTRL+9" =
    ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Restore_CNN_S.glsl"; show-text "Anime4K_Restore_S"'';
}
