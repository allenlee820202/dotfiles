# Starship prompt configuration
eval "$(starship init zsh)"

# My alias
alias ll="ls -al"
alias k="kubectl"
alias tf="terraform"
alias code="code-insiders"

# git alias
alias ga="git add"
alias gb="git branch"
alias gc="git commit -v"
alias gcmsg="git commit -m"
alias gco="git checkout"
alias glg="git log --stat"
alias gm="git merge"
alias grst="git restore --staged"
alias gst="git status"
alias gsta="git stash push"
alias gstaa="git stash apply"
ggpush() {
  local dir="."  # default to current directory
  local branch=$(git -C "$dir" branch | sed '/^\*/!d;s/\* //')
  git -C "$dir" push "$@" origin "$branch"
}
ggpull() {
  local dir="."  # default to current directory
  local branch=$(git -C "$1" branch | sed  '/^\*/!d;s/\* //')
  git -C "$dir" pull "$@" origin "$branch"
}

# uv alias workaround
alias python="uv run python"
alias python3="uv run python3"
alias python3.13="uv run python3"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# GVM https://github.com/moovweb/gvm
source /Users/al02507344/.gvm/scripts/gvm 

# direnv
eval "$(direnv hook zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# fzf fuzzy search
source <(fzf --zsh)

# nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/Users/al02507344/.gvm/scripts/gvm" ]] && source "/Users/al02507344/.gvm/scripts/gvm"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/al02507344/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# zprof

# ntoken file path
export NTOKEN_FILE="$HOME/.config/zms/.ntoken"

# Goose
export PATH="/Users/al02507344/.local/bin:$PATH"

# zsh-history-substring-search
# Use up and down arrows to search through history
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Define which characters are considered part of a "word"
# Here, we remove `-`, `_`, `/` from word characters so Zsh treats them as delimiters
autoload -U select-word-style
select-word-style bash

# Optionally refine more word-chars behavior
WORDCHARS='*?_[]~=&;!#$%^(){}<>'

# Rebind Option+Delete and Option+Right for better word-wise deletion
bindkey "^[^?" backward-kill-word    # Option + Delete (delete one word left)
bindkey "^[f" forward-word           # Option + Right
bindkey "^[b" backward-word          # Option + Left


export GPG_TTY=$(tty)
