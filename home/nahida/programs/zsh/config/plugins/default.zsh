ZPLUGINS="$ZDOTDIR/plugins"

source "$ZPLUGINS/ohmyzsh.zsh"
source "$ZPLUGINS/other_plugins.zsh"
zvm_after_init_commands+=("source \"$ZPLUGINS/fzf.zsh\"; export GPG_TTY=$TTY")
source "$ZPLUGINS/load_theme.zsh"
source "$ZPLUGINS/load_local_plugins.zsh"

unset ZPLUGINS
