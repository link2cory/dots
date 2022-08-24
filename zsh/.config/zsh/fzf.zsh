# fzf layout options
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40% --border --extended --preview "bat --color=always {} | head -500"'

# using tmux
export FZF_TMUX=0
export FZF_TMUX_HEIGHT=20%

# keybinds
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

fzf_preview() {
    fd --type f \
      | fzf \
        --multi \
        --preview-window right:70% \
        --preview "bat --color=always --theme="$BAT_THEME" {} | head -500" \
      | tr '\n' ' ' \
}

fzf_edit() {
  setopt sh_word_split
  local files=("$(fzf_preview)")
  if [ -n "$files" ]; then
    vim -p $files
  fi
}
# fzf-edit-widget() LBUFFER+=$(edit)
# fzf-edit-widget() LBUFFER+=$(fzf_edit | join-lines)
# fzf-edit-widget() {
#   'vim $(fzf)'
# }
# ALT-C - cd into the selected directory
fzf-edit-widget() {
  IFS=$'\n'
  echo "hello"
  # local cmd="`fzf`"
  zle accept-line
  # local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
  #   -o -type d -print 2> /dev/null | cut -b3-"}"
  # setopt localoptions pipefail no_aliases 2> /dev/null
  # local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"

  # local cmd ="${FZF_DEFAULT_COMMAND}"
  # echo ${cmd}
  # local files = $(eval "$cmd")
  # echo $(files)
  # if [[ -z "$dir" ]]; then
  #   zle redisplay
  #   return 0
  # fi
  # zle push-line # Clear buffer. Auto-restored on next prompt.
  # BUFFER="cd -- ${(q)dir}"
  # zle accept-line
  # local ret=$?
  # unset dir # ensure this doesn't end up appearing in prompt expansion
  # zle reset-prompt
  # return $ret
}

zle -N fzf-edit-widget
bindkey -M vicmd '^Y' fzf-edit-widget
bindkey -M viins '^Y' fzf-edit-widget
# bindkey -M viins '^Y' fzf-edit-widget
# bindkey -M vicmd '^Y' fzf-edit-widget
