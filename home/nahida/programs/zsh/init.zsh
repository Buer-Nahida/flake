# fortune随机诗词
fortune -e tang300 song100 | lolcat

# 加载zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zi ice blockf atpull'zi creinstall -q .'

autoload compinit
compinit

source "$ZDOTDIR/plugins/default.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/zstyle.zsh"
source "$ZDOTDIR/github_ssh_agent_autostart.zsh"
