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

# use btop instead of top
alias top='btop'

# listings
alias ls='exa --group-directories-first --git --long --header --icons --sort=extension'
alias la='exa --group-directories-first --git --long --header --icons --sort=extension --all'
alias tree='exa --group-directories-first --git --long --header --icons --sort=extension --all --tree --level=2'

# tree shorthand

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
alias gcp="git cherry-pick"
alias gcpn="git cherry-pick --no-commit"
alias gdsm="git log --left-only --pretty=format:"%h%x09%an%x09%ad%x09%s" --cherry-pick origin/staging...origin/master"

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


alias ss='grim -g "$(slurp)" - | wl-copy'

# code generators
alias plop='npm run plop'


# tiphuas aliases
alias artisan='docker exec -it laradock-workspace-1 php artisan'

# phpunit() {
#   docker exec -it laradock-workspace-1 php artisan test
# }
# alias redeploy 'npx cdk destroy hello --context env=sbx -f && npx cdk deploy hello --context env=sbx --require-approval never'
# Define a function with parameters
redeploy() {
    npx cdk destroy $1 --context env=${2:-sbx} -f && npx cdk deploy $1 --context env=${2:-sbx} --require-approval never
}
alias psm="jira issue list --jql 'assignee = currentUser() AND status != Done' -p PSM"

# npm entrypoints
alias cdk='npx cdk'



# custom application entrypoints
# alias obsidian='~/.local/bin/obsidian'
alias workbench='~/.local/bin/mysql-workbench'
alias img='swayimg'
