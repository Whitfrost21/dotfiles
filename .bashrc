#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
# ── my old prompt──
# PS1='\[\e[38;5;81m\]\u\[\e[0m\] \[\e[38;5;252m\]\w\[\e[0m\] \[\e[38;5;109m\]⟩\[\e[0m\] '
# PS1='\[\e[30;46m\] \u \[\e[0m\] \[\e[30;42m\] \w \[\e[0m\] \n❯ '
eval "$(starship init bash)"

export PATH=$HOME/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export SAL_USE_VCLPLUGIN=gtk3
# pnpm
export PNPM_HOME="~/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
source ~/.bun-completions.bash

# wallust colors
if [ -f "$HOME/.cache/wallust/sequences" ]; then
  cat "$HOME/.cache/wallust/sequences"
fi

export EDITOR="nvim"
export CLASSPATH="$HOME/workspace/java(no way)/trn/cuts/shorts.jar:.:$HOME/workspace/java(no way)/trn/Database:$HOME/workspace/java(no way)/trn/Database/mariadb-java-client-3.5.9.jar"

#gtk theme 
export GTK_THEME="orchis"
