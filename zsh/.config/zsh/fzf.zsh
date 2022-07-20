# fzf layout options
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 20% --border --extended'

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
fzf-edit-widget() LBUFFER+=$(fzf_edit | join-lines)
zle -N fzf_edit
bindkey '^Y' fzf_edit
