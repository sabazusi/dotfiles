#zsh theme
#PROMPT='%{$fg[cyan]%}┌[%{$fg_bold[cyan]%}%n%{$reset_color%}%{$fg[cyan]%}%{$fg_bold[blue]%}@%M%{$reset_color%}%{$fg[cyan]%}]%{$fg[white]%}-%{$fg[cyan]%}>>%{$fg_bold[red]%}%~%{$reset_color%}%{$fg[cyan]%}<<$(git_prompt_info)
#└>> % %{$reset_color%}'
PROMPT='%{$fg[cyan]%}┌[%{$fg_bold[red]%}%~%{$reset_color%}%{$fg_bold[green]%}@%M%{$reset_color%}%{$fg[cyan]%}]$(git_prompt_info)
└>> % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="-[%{$reset_color%}%{$fg[white]%}git://%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[cyan]%}]-"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
