ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{${fg_bold[green]}%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{${reset_color}%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{${fg_bold[yellow]}%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔%{${reset_color}%} "

function prompt_char {
  if [ "$UID" -eq 0 ]; then echo "%{${fg[red]}%}#%{${reset_color}%}"; else echo "%(?:%{${fg[green]}%}$%{${reset_color}%}:%{${fg[red]}%}$%{${reset_color}%})"; fi
}

PROMPT='%(?,,%{${fg[red]}%}exit: $?%{${reset_color}%}
)${(r:$COLUMNS::.:)}
%{${fg_bold[yellow]}%}%n%{${reset_color}%}@%{${fg_bold[blue]}%}%m%{${reset_color}%} ➜ %{${fg_bold[magenta]}%}%~ %{${reset_color}%}$(git_prompt_info) %{${fg[cyan]}%}[%*]%{${reset_color}%}
$(prompt_char) '
