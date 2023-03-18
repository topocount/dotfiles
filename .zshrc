# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set umask
umask 027
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=$PATH:$HOME/.asdf/installs/nodejs/10.18.1/.npm/bin
export PATH=$PATH:$HOME/.todo
# Add ruby to path
export PATH=$PATH:$HOME/.gem/ruby/3.0.0/bin
# Add AppImages to the path
export PATH=$PATH:/opt/appimages:$HOME/Apps

# Add hardhat solc binaries to path
export PATH=$PATH:~/.cache/hardhat-nodejs/compilers/linux-amd64

# Path to your oh-my-zsh installation.
export ZSH="/home/kevin/.oh-my-zsh"

# GTK Dark Theme
# This is now done in .xprofile
export GTK_THEME=Adwaita:dark

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias  nvpn=nordvpn
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# utilize x11-friendly config when available
if [[ $XDG_SESSION_TYPE == "x11" ]]
  then source ~/.p10k_x11.zsh
  # fall back to vanilla config for tty shells
  else source ~/.p10k_tty.zsh
fi

# User settings from Bash
# GOPATH
export GOPATH=~/go
# Add user's go bin to path
# export PATH=$PATH:~/go/bin
# Added to ~/.profile

# Rust path
# export PATH=$PATH:~/.cargo/bin
# Added to ~/.profile

# Ruby
# Add Ruby bins to path
export PATH=$PATH:~/.gem/bin

# add yarn global bin to path
export PATH=$PATH:~/.yarn/bin

# todo.txt
export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh'

# sourcecred global command
alias nsc='node ~/Projects/sourceCred/sc-core/packages/sourcecred/bin/sourcecred.js'

# sourcecred testing command
alias scdev='node ~/Projects/sourceCred/core-testing/packages/sourcecred/bin/sourcecred.js'

# static server
alias serve="python3 -m http.server 6060"

# set up NVM
export NVM_DIR="$HOME/.config/nvm"
export function setup_nvm () {
  export SHARP_IGNORE_GLOBAL_LIBVIPS=1
  [ -s "$NVM_DIR/nvm.sh" ] &&
  \. "$NVM_DIR/nvm.sh"
} # This loads nvm

# mac gsed compat with coreutil sed
export gsed=sed

# default to vim-bindings in gnu info
alias info="info --vi-keys"
alias vi=nvim

# Rootless Docker
# Can't seem to get this working yet
# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# opam configuration
test -r /home/kevin/.opam/opam-init/init.zsh && . /home/kevin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# expand available node memory
# export NODE_OPTIONS="--max_old-space_size=4096"

# For Docker host connections
export DOCKER_GATEWAY_HOST=172.17.0.1

# Temp dir config
export TMPDIR=/tmp

# add i3 aliases to env if i3 is running
[[ $XDG_SESSION_DESKTOP == i3* ]] && alias i3config="vi ~/.config/i3/config" &&
  alias lock="i3lock -t -i /home/kevin/Dropbox/'4k_backgrounds'/desktop/Backgrounds/lockscreen.png" &&
  alias snooze="lock && systemctl suspend"

export PATH="$PATH:/home/kevin/.foundry/bin"
export PATH="$PATH:/home/kevin/.local/share/gem/ruby/3.0.0/bin"

PATH="/home/kevin/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/kevin/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/kevin/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/kevin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/kevin/perl5"; export PERL_MM_OPT;

# Created by `pipx` on 2022-07-22 14:13:21
export PATH="$PATH:/home/kevin/.local/bin"

# pyenv status indicator
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: /home/kevin/.yarn/bin/gt completion >> ~/.zshrc
#    or /home/kevin/.yarn/bin/gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /home/kevin/.yarn/bin/gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###

# pnpm
export PNPM_HOME="/home/kevin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
