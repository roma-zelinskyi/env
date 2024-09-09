ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "

vcs_status() {
  if (( ${+functions[in_svn]} )) && in_svn; then
    svn_prompt_info
  elif (( ${+functions[in_hg]} )) && in_hg; then
    hg_prompt_info
  else
    git_prompt_info
  fi
}

PROMPT='  %F{cyan}%3~%f $(vcs_status)%F{green}%f »%b '
