#compdef exa

_exa() {
  local -a exa_output
  exa_output=("${(@f)$(exa --grid --color=never --classify --color-scale --icons --no-group --ignore-glob=*.txt "$LBUFFER")}")

  # Filter out non-directories
  local -a directories
  for item in "${exa_output[@]}"; do
    if [[ -d $item ]]; then
      directories+=($item)
    fi
  done

  # Highlight directories in a different color
  local -a highlighted_directories
  for directory in "${directories[@]}"; do
    highlighted_directories+=("%F{blue}$directory%f")
  done

  # Set completions to directories only
  compadd -a highlighted_directories
}

_exa "$@"

