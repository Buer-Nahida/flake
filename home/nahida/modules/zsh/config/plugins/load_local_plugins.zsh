if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh --no-cmd)"
    alias j="__zoxide_z"
    alias jj="__zoxide_zi"
else
    echo "Zoxide not found, please install it from https://github.com/ajeetdsouza/zoxide"
fi
