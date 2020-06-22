# kube-ps1
export KUBE_PS1_SYMBOL_ENABLE=false
source ~/.scripts/kube-ps1.sh


# git-prompt
source ~/.scripts/git-prompt.sh


# PROMPT_COMMAND
PROMPT_COMMAND='__posh_git_ps1 "\u@\h: \$(kube_ps1) \n\w " "\$ ";'$PROMPT_COMMAND

function open () {
  xdg-open "$@">/dev/null 2>&1
}
