## appearance
# vsc info
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
setopt prompt_subst

PROMPT="%F{cyan} (*´ω｀*) %F{yellow} %~ %f"'${vcs_info_msg_0_}'"
%F{green} => %f"

## plugins with zplug
# requirement: https://github.com/zplug/zplug
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "mollifier/cd-gitroot"
zplug "zsh-users/zsh-completions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose > /dev/null


## peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
