zstyle ':completion:*:git-checkout:*' sort         false                            # 禁用`git checkout`的排序
zstyle ':completion:*:descriptions'   format       '[%d]'                           # 组支持
zstyle ':completion:*'                list-colors  ${(s.:.)LS_COLORS}               # 启用文件名颜色
zstyle ':fzf-tab:complete:cd:*'       fzf-preview  'ls --color=always -1 $realpath' # fzf显示目录中的文件夹
zstyle ':fzf-tab:*'                   switch-group ',' '.'                          # fzf使用','和'.'切换组
