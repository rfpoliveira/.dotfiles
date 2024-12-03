###############
### General ###
###############

# Correct wrong spellings
setopt correct

# Load colors
autoload -U colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
   eval $COLOR='$fg_no_bold[${(L)COLOR}]'
   eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
done
eval NC='$reset_color'

##################
### Completion ###
##################

# Load and initialise completion system
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$XDG_CACHE_HOME/zsh/.zshcompdump-$ZSH_VERSION"
_comp_options+=(globdots)

##########################
### Zap Plugin Manager ###
##########################

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-history-substring-search"
plug "MichaelAquilina/zsh-you-should-use"
plug "zap-zsh/completions"
plug "zap-zsh/sudo"
plug "web-search"
#plug "zap-zsh/fzf"
plug "zap-zsh/web-search"
plug "jeffreytse/zsh-vi-mode"

#######################
### Zedro's Scripts ###
#######################

# tmux
alias zmux=~/.dotfiles/scripts/tmux/zmux-init.sh
alias xmux=~/.dotfiles/scripts/tmux/zmux-kill.sh

# Screen Recording
# kill simplescreenrecorder
alias kill-screenrec=~/.dotfiles/scripts/i3/kill-screenrec.sh

# lulz
alias greet=~/.dotfiles/scripts/zsh/zsh-greet.sh
alias zshcow=~/.dotfiles/scripts/zsh/cowsay-fortune.sh

#################
### Greetings ###
#################

greet $HOST

################
### Keyboard ###
################

eval "setxkbmap us"

#######################
### rpedrosa's Aliases ###
#######################

if [[ $USER == "rpedrosa" ]]; then
	alias mini='~/mini-moulinette/mini-moul.sh'
	alias cl='clear'
	alias gdbgo='gdb --tui a.out'
	alias rma='rm a.out'
	alias mvft='mv ft_*.c cfiles'
	alias nor='norminette -R checkForbiddenSourceHeader'
	alias ccf='cc -Wall -Werror -Wextra -g'
	alias wig='git ls-tree --full-tree -r --name-only HEAD'
	alias v='nvim'
	alias ga='git add .'
	alias gcm='git commit -m 00'
	alias gp='git push'
	alias fancygrind='valgrind -s --leak-check=full --show-leak-kinds=all --track-origins=yes'
# elif [[ $USER == "rpedrosa" ]]; then
fi

export PATH=$HOME/neovim/bin:$PATH
export CC=/usr/bin/gcc

# Glow Markdown Renderer
alias glow=~/bin/glow/glow

# Load Cowsay
if command -v lolcat > /dev/null 2>&1; then
	eval "zshcow" | lolcat
else
	eval "zshcow"
fi

############################
### Load Starship Prompt ###
############################

if command -v starship > /dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    ZSH_THEME="refined"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Load Homebrew config script
source $HOME/.brewconfig.zsh
