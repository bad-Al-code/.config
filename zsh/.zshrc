# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

##########################################################################################
#                                 OH MY ZSH PLUGINS
##########################################################################################

plugins=(
  aws
	zsh-autosuggestions 
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

###########################################################################################
#                                ALIASES AND ALIASES
#########################################################################################

alias c=clear
alias history="history -E"
# alias ls='lsd'
alias ls='eza --icons=always'
# alias la="eza --all --long --icons --git --tree --level=1"
alias la="eza --all --git --tree --level=1 --icons=always"
alias l='la'
alias ll='l'

# alias bat='batcat'
alias bt="acpi"
alias al="sudo apt update; sudo apt upgrade -y; brew update; brew upgrade; sudo apt autoremove -y; sudo apt clean; brew cleanup;"
alias cl='sudo apt autoremove -y; sudo apt clean; brew cleanup;'
alias lg="lazygit"

alias r='source ~/.zshrc'
alias n='nvim'

alias air='~/go/bin/air'

# python 
alias python='python3'
alias pip='pip3'

# tmux 
alias t="tmux"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"
alias tn="tmux new -s"

# git 
alias gs="git status -s"
alias gl='git log --oneline --all --graph'

###########################################################################################

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

export PATH=$PATH:/usr/local/go/bin

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

######## fzf #########
eval "$(fzf --zsh)"
source /usr/share/doc/fzf/examples/key-bindings.zsh

######## fd #########
# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

######## fzf-git #########
source ~/fzf-git.sh/fzf-git.sh
if [[ -n $TMUX ]]; then
  source ~/fzf-git.sh/fzf-git.sh 
fi

######## bat #########
export BAT_THEME=tokyonight_night


########  Setup fzf previews #########
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# thefuck 
eval $(thefuck --alias)


######## zocide #########
eval "$(zoxide init zsh)"
alias cd="z"

# yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


export PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@15/bin:$PATH" 
export PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@16/bin:$PATH"

source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
