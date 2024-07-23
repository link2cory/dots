# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/aliases.zsh
# source ~/.config/zsh/fzf.zsh
# source ~/.config/zsh/startup.zsh
source ~/.config/zsh/keybinds.zsh
# source ~/.config/zsh/autosuggestions.zsh
source ~/.config/zsh/history.zsh
# source ~/.config/zsh/sensitive.zsh

NIXOS_OZONE_WL=1

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cory/.zshrc'

autoload -Uz compinit
fpath+=~/.config/zsh/completions
compinit
# End of lines added by compinstall
#
path+=('/home/cory/.local/bin/')
path+=('/home/cory/.cargo/bin/')
export path

QT_QPA_PLATFORM=wayland

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

