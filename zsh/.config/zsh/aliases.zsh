alias vim="nvim"
alias vi="nvim"

# deal with tmux 256 color dealio
alias tmux='tmux -2'

# force fzf to use tmux panes
alias fzf=fzf-tmux

# disable flow control in the terminal while vim is running
alias vim="stty stop '' -ixoff ; nvim"
alias vimdiff="nvim -d"
ttyctl -f

# always use ls colors
alias ls='ls --color=tty'
alias ll='ls -lp'
alias la='ls -lap'

alias grep='grep --color=auto --exclude-dir={.git}'

# use bat instead of cat
alias cat='bat'

# tree shorthand
alias t='tree'

# firefox shortcut
alias ff='firefox'

# git shorthand
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gd='git diff'
alias ga='git add'
alias gap='git add -p'
alias gp='git push'
alias gpu='git push --set-upstream'
alias gl='git log --oneline --graph'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -D'
alias grm='git rm'
alias gm='git merge'
alias gds='git diff --staged'

# docker 
alias di='docker image'
alias dt='docker container'
alias dv='docker volume'
alias dn='docker network'
alias dl='docker logs'

# docker machine
alias dm='docker-machine'

# docker compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs'

# custom docker scripts
alias dpa='docker-prune-all'

