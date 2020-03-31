source ~/.bash_profile
export ZSH="/Users/chriselie/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(git emoji pipenv)

source $ZSH/oh-my-zsh.sh

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)🌈"
  fi
}

alias ls='ls --color=tty'

## git fetch and pull
alias gfp='git fetch && git pull'

## Bye vim
alias vim='nvim'

# fzf search with rg
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!venv/*" --glob "!.eggs/*" --glob "!__pycache__/*"'
