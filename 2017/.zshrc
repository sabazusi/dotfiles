## copy your home dir
## ln -s .zshrc ~/.zshrc

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

## colordiff
# requirement: https://www.colordiff.org/
#              brew install colordiff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

## peco
# requirement: https://github.com/peco/peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

## history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups

## completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit

## write own env settings in ".zshrc_local"
[ -f $HOME/.zshrc_local ] && . $HOME/.zshrc_local
