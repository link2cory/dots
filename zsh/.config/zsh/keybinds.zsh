# Allow Ctrl-z to toggle between suspend and resume
function Resume {
  fg
  zle push-input
  BUFFER=""
  zle accept-line
}
zle -N Resume

bindkey "^Z" Resume


function vi-yank-clip {
    zle vi-yank
   echo "$CUTBUFFER" | wl-copy
}
zle -N vi-yank-clip
bindkey -M vicmd 'y' vi-yank-clip
