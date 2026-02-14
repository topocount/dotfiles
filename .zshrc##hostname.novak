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
plugins=(git zsh-autosuggestions colored-man-pages direnv)

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
alias pn=pnpm
alias tf=terraform
alias neofetch=fastfetch
alias kxc=keepassxc-cli

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

# allow for shift-selection and deletions
r-delregion() {
  if ((REGION_ACTIVE)) then
     zle kill-region
  else
    local widget_name=$1
    shift
    zle $widget_name -- $@
  fi
}

r-deselect() {
  ((REGION_ACTIVE = 0))
  local widget_name=$1
  shift
  zle $widget_name -- $@
}

r-select() {
  ((REGION_ACTIVE)) || zle set-mark-command
  local widget_name=$1
  shift
  zle $widget_name -- $@
}

for key     kcap   seq        mode   widget (
    sleft   kLFT   $'\e[1;2D' select   backward-char
    sright  kRIT   $'\e[1;2C' select   forward-char
    sup     kri    $'\e[1;2A' select   up-line-or-history
    sdown   kind   $'\e[1;2B' select   down-line-or-history

    send    kEND   $'\E[1;2F' select   end-of-line
    send2   x      $'\E[4;2~' select   end-of-line

    shome   kHOM   $'\E[1;2H' select   beginning-of-line
    shome2  x      $'\E[1;2~' select   beginning-of-line

    left    kcub1  $'\EOD'    deselect backward-char

    end     kend   $'\EOF'    deselect end-of-line
    end2    x      $'\E4~'    deselect end-of-line

    home    khome  $'\EOH'    deselect beginning-of-line
    home2   x      $'\E1~'    deselect beginning-of-line

    csleft  x      $'\E[1;6D' select   backward-word
    csright x      $'\E[1;6C' select   forward-word
    csend   x      $'\E[1;6F' select   end-of-line
    cshome  x      $'\E[1;6H' select   beginning-of-line

    cleft   x      $'\E[1;5D' deselect backward-word
    cright  x      $'\E[1;5C' deselect forward-word

    del     kdch1   $'\E[3~'  delregion delete-char
    bs      x       $'^?'     delregion backward-delete-char

  ) {
  eval "key-$key() {
    r-$mode $widget \$@
  }"
  zle -N key-$key
  bindkey ${terminfo[$kcap]-$seq} key-$key
}

# restore backward-delete-char for Backspace in the incremental
# search keymap so it keeps working there:
bindkey -M isearch '^?' backward-delete-char
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
  if [[ $(uname -n) -eq fw13 ]]; then
    source /usr/share/nvm/init-nvm.sh
  else

  [ -s "$NVM_DIR/nvm.sh" ] &&
  \. "$NVM_DIR/nvm.sh" &&
  nvm use;

  # load nvm bash completions
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  fi
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

# add nvim config alias
alias nvimconfig="nvim ~/.config/nvim/lua/usermod/plugins.lua"
# add i3 aliases to env if i3 is running
[[ $XDG_SESSION_DESKTOP == i3* ]] && alias i3config="vi ~/.config/i3/config" &&
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
#export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# pnpm
export PNPM_HOME="/home/kevin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# tmux nonsense for silencing stdout noise
export DISABLE_AUTO_TITLE=true

# utilize bashcompinit
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# setup aws completions
AWS_PATH=$(which aws_completer)
 [[ -e $AWS_PATH ]] && complete -C $AWS_PATH aws

#compdef doppler
compdef _doppler doppler

# zsh completion for doppler                              -*- shell-script -*-

__doppler_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_doppler()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16
    local shellCompDirectiveKeepOrder=32

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace keepOrder
    local -a completions

    __doppler_debug "\n========= starting completion logic =========="
    __doppler_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __doppler_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __doppler_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., doppler -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __doppler_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __doppler_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __doppler_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __doppler_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __doppler_debug "No directive found.  Setting do default"
        directive=0
    fi

    __doppler_debug "directive: ${directive}"
    __doppler_debug "completions: ${out}"
    __doppler_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __doppler_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __doppler_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __doppler_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __doppler_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __doppler_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __doppler_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveKeepOrder)) -ne 0 ]; then
        __doppler_debug "Activating keep order."
        keepOrder="-V"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __doppler_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __doppler_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __doppler_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __doppler_debug "Calling _describe"
        if eval _describe $keepOrder "completions" completions $flagPrefix $noSpace; then
            __doppler_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __doppler_debug "_describe did not find completions."
            __doppler_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __doppler_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __doppler_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_doppler" ]; then
    _doppler
fi

HISTORY_IGNORE="(doppler secrets set*)"

[ -f "/home/kevin/.ghcup/env" ] && source "/home/kevin/.ghcup/env" # ghcup-env

#compdef forge

autoload -U is-at-least

_forge() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_forge_commands" \
"*::: :->forge" \
&& ret=0
    case $state in
    (forge)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:forge-command-$line[1]:"
        case $line[1] in
            (test)
_arguments "${_arguments_options[@]}" \
'--debug=[Run a test in the debugger]:TEST_FUNCTION: ' \
'--etherscan-api-key=[The Etherscan (or equivalent) API key]:KEY: ' \
'--fuzz-seed=[Set seed used to generate randomness during your fuzz runs]:FUZZ_SEED: ' \
'--fuzz-runs=[]:RUNS: ' \
'--match-test=[Only run test functions matching the specified regex pattern]:REGEX: ' \
'--mt=[Only run test functions matching the specified regex pattern]:REGEX: ' \
'--no-match-test=[Only run test functions that do not match the specified regex pattern]:REGEX: ' \
'--nmt=[Only run test functions that do not match the specified regex pattern]:REGEX: ' \
'--match-contract=[Only run tests in contracts matching the specified regex pattern]:REGEX: ' \
'--mc=[Only run tests in contracts matching the specified regex pattern]:REGEX: ' \
'--no-match-contract=[Only run tests in contracts that do not match the specified regex pattern]:REGEX: ' \
'--nmc=[Only run tests in contracts that do not match the specified regex pattern]:REGEX: ' \
'--match-path=[Only run tests in source files matching the specified glob pattern]:GLOB: ' \
'--mp=[Only run tests in source files matching the specified glob pattern]:GLOB: ' \
'--no-match-path=[Only run tests in source files that do not match the specified glob pattern]:GLOB: ' \
'--nmp=[Only run tests in source files that do not match the specified glob pattern]:GLOB: ' \
'-f+[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--rpc-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-block-number=[Fetch state from a specific block number over a remote endpoint]:BLOCK: ' \
'--fork-retry-backoff=[Initial retry backoff on encountering errors]:BACKOFF: ' \
'--initial-balance=[The initial balance of deployed test contracts]:BALANCE: ' \
'--sender=[The address which will be executing tests]:ADDRESS: ' \
'--compute-units-per-second=[Sets the number of assumed available compute units per second for this provider]:CUPS: ' \
'--gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--code-size-limit=[EIP-170\: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)]:CODE_SIZE: ' \
'--chain-id=[The chain ID]:CHAIN_ID: ' \
'--gas-price=[The gas price]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[The base fee in a block]:FEE: ' \
'--base-fee=[The base fee in a block]:FEE: ' \
'--tx-origin=[The transaction origin]:ADDRESS: ' \
'--block-coinbase=[The coinbase of the block]:ADDRESS: ' \
'--block-timestamp=[The timestamp of the block]:TIMESTAMP: ' \
'--block-number=[The block number]:BLOCK: ' \
'--block-difficulty=[The block difficulty]:DIFFICULTY: ' \
'--block-prevrandao=[The block prevrandao value. NOTE\: Before merge this field was mix_hash]:PREVRANDAO: ' \
'--block-gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--memory-limit=[The memory limit of the EVM in bytes (32 MB by default)]:MEMORY_LIMIT: ' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'*-w+[Watch the given files or directories for changes]' \
'*--watch=[Watch the given files or directories for changes]' \
'--watch-delay=[File update debounce delay]:DELAY: ' \
'--gas-report[Print a gas report]' \
'--allow-failure[Exit with code 0 even if a test fails]' \
'-j[Output test results in JSON format]' \
'--json[Output test results in JSON format]' \
'--fail-fast[Stop running tests after the first failure]' \
'-l[List tests instead of running them]' \
'--list[List tests instead of running them]' \
'--no-storage-caching[Explicitly disables the use of RPC caching]' \
'--ffi[Enable the FFI cheatcode]' \
'*-v[Verbosity of the EVM.]' \
'*--verbosity[Verbosity of the EVM.]' \
'--no-rpc-rate-limit[Disables rate limiting for this node'\''s provider]' \
'--no-rate-limit[Disables rate limiting for this node'\''s provider]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'--no-restart[Do not restart the command while it'\''s still running]' \
'--run-all[Explicitly re-run all tests when a change is made]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(script)
_arguments "${_arguments_options[@]}" \
'--target-contract=[The name of the contract you want to run]:CONTRACT_NAME: ' \
'--tc=[The name of the contract you want to run]:CONTRACT_NAME: ' \
'-s+[The signature of the function you want to call in the contract, or raw calldata]:SIG: ' \
'--sig=[The signature of the function you want to call in the contract, or raw calldata]:SIG: ' \
'-g+[Relative percentage to multiply gas estimates by]:GAS_ESTIMATE_MULTIPLIER: ' \
'--gas-estimate-multiplier=[Relative percentage to multiply gas estimates by]:GAS_ESTIMATE_MULTIPLIER: ' \
'--etherscan-api-key=[The Etherscan (or equivalent) API key]:KEY: ' \
'--with-gas-price=[Gas price for legacy transactions, or max fee per gas for EIP1559 transactions]:PRICE: ' \
'*--skip=[Skip building files whose names contain the given filter]:SKIP: ' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'*-w+[Watch the given files or directories for changes]' \
'*--watch=[Watch the given files or directories for changes]' \
'--watch-delay=[File update debounce delay]:DELAY: ' \
'*-a+[The sender accounts]' \
'*--froms=[The sender accounts]' \
'-i+[Open an interactive prompt to enter your private key]:NUM: ' \
'--interactives=[Open an interactive prompt to enter your private key]:NUM: ' \
'*--private-keys=[Use the provided private keys]:RAW_PRIVATE_KEYS: ' \
'(--private-keys)--private-key=[Use the provided private key]:RAW_PRIVATE_KEY: ' \
'*--mnemonics=[Use the mnemonic phrases of mnemonic files at the specified paths]:MNEMONICS: ' \
'*--mnemonic-passphrases=[Use a BIP39 passphrases for the mnemonic]:PASSPHRASE: ' \
'*--mnemonic-derivation-paths=[The wallet derivation path]:PATH: ' \
'(--mnemonic-derivation-paths)*--mnemonic-indexes=[Use the private key from the given mnemonic index]:INDEXES: ' \
'*--keystore=[Use the keystore in the given folder or file]:PATHS: ' \
'*--keystores=[Use the keystore in the given folder or file]:PATHS: ' \
'*--password=[The keystore password]:PASSWORDS: ' \
'*--password-file=[The keystore password file path]:PATHS: ' \
'-f+[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--rpc-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-block-number=[Fetch state from a specific block number over a remote endpoint]:BLOCK: ' \
'--fork-retry-backoff=[Initial retry backoff on encountering errors]:BACKOFF: ' \
'--initial-balance=[The initial balance of deployed test contracts]:BALANCE: ' \
'--sender=[The address which will be executing tests]:ADDRESS: ' \
'--compute-units-per-second=[Sets the number of assumed available compute units per second for this provider]:CUPS: ' \
'--gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--code-size-limit=[EIP-170\: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)]:CODE_SIZE: ' \
'--chain-id=[The chain ID]:CHAIN_ID: ' \
'--gas-price=[The gas price]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[The base fee in a block]:FEE: ' \
'--base-fee=[The base fee in a block]:FEE: ' \
'--tx-origin=[The transaction origin]:ADDRESS: ' \
'--block-coinbase=[The coinbase of the block]:ADDRESS: ' \
'--block-timestamp=[The timestamp of the block]:TIMESTAMP: ' \
'--block-number=[The block number]:BLOCK: ' \
'--block-difficulty=[The block difficulty]:DIFFICULTY: ' \
'--block-prevrandao=[The block prevrandao value. NOTE\: Before merge this field was mix_hash]:PREVRANDAO: ' \
'--block-gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--memory-limit=[The memory limit of the EVM in bytes (32 MB by default)]:MEMORY_LIMIT: ' \
'--verifier=[The contract verification provider to use]:VERIFIER:(etherscan sourcify blockscout)' \
'--verifier-url=[The verifier URL, if using a custom provider]:VERIFIER_URL: ' \
'--retries=[Number of attempts for retrying verification]:RETRIES: ' \
'--delay=[Optional delay to apply inbetween verification attempts, in seconds]:DELAY: ' \
'--legacy[Use legacy transactions instead of EIP1559 ones]' \
'--broadcast[Broadcasts the transactions]' \
'--skip-simulation[Skips on-chain simulation]' \
'(--private-key --private-keys -a --froms -l --ledger -t --trezor --aws)--unlocked[Send via \`eth_sendTransaction\` using the \`--from\` argument or \`\$ETH_FROM\` as sender]' \
'--resume[Resumes submitting transactions that failed or timed-out previously]' \
'--multi[If present, --resume or --verify will be assumed to be a multi chain deployment]' \
'--debug[Open the script in the debugger]' \
'--slow[Makes sure a transaction is sent, only after its previous one has been confirmed and succeeded]' \
'--verify[Verifies all the contracts found in the receipts of a script, if any]' \
'--json[Output results in JSON format]' \
'--names[Print compiled contract names]' \
'--sizes[Print compiled contract sizes]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'--no-restart[Do not restart the command while it'\''s still running]' \
'--run-all[Explicitly re-run all tests when a change is made]' \
'-l[Use a Ledger hardware wallet]' \
'--ledger[Use a Ledger hardware wallet]' \
'-t[Use a Trezor hardware wallet]' \
'--trezor[Use a Trezor hardware wallet]' \
'--aws[Use AWS Key Management Service]' \
'--no-storage-caching[Explicitly disables the use of RPC caching]' \
'--ffi[Enable the FFI cheatcode]' \
'*-v[Verbosity of the EVM.]' \
'*--verbosity[Verbosity of the EVM.]' \
'--no-rpc-rate-limit[Disables rate limiting for this node'\''s provider]' \
'--no-rate-limit[Disables rate limiting for this node'\''s provider]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':path -- The contract you want to run. Either the file path or contract name:_files' \
'*::args -- Arguments to pass to the script function:' \
&& ret=0
;;
(coverage)
_arguments "${_arguments_options[@]}" \
'*--report=[The report type to use for coverage]:REPORT:(summary lcov debug)' \
'--match-test=[Only run test functions matching the specified regex pattern]:REGEX: ' \
'--mt=[Only run test functions matching the specified regex pattern]:REGEX: ' \
'--no-match-test=[Only run test functions that do not match the specified regex pattern]:REGEX: ' \
'--nmt=[Only run test functions that do not match the specified regex pattern]:REGEX: ' \
'--match-contract=[Only run tests in contracts matching the specified regex pattern]:REGEX: ' \
'--mc=[Only run tests in contracts matching the specified regex pattern]:REGEX: ' \
'--no-match-contract=[Only run tests in contracts that do not match the specified regex pattern]:REGEX: ' \
'--nmc=[Only run tests in contracts that do not match the specified regex pattern]:REGEX: ' \
'--match-path=[Only run tests in source files matching the specified glob pattern]:GLOB: ' \
'--mp=[Only run tests in source files matching the specified glob pattern]:GLOB: ' \
'--no-match-path=[Only run tests in source files that do not match the specified glob pattern]:GLOB: ' \
'--nmp=[Only run tests in source files that do not match the specified glob pattern]:GLOB: ' \
'-f+[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--rpc-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-block-number=[Fetch state from a specific block number over a remote endpoint]:BLOCK: ' \
'--fork-retry-backoff=[Initial retry backoff on encountering errors]:BACKOFF: ' \
'--initial-balance=[The initial balance of deployed test contracts]:BALANCE: ' \
'--sender=[The address which will be executing tests]:ADDRESS: ' \
'--compute-units-per-second=[Sets the number of assumed available compute units per second for this provider]:CUPS: ' \
'--gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--code-size-limit=[EIP-170\: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)]:CODE_SIZE: ' \
'--chain-id=[The chain ID]:CHAIN_ID: ' \
'--gas-price=[The gas price]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[The base fee in a block]:FEE: ' \
'--base-fee=[The base fee in a block]:FEE: ' \
'--tx-origin=[The transaction origin]:ADDRESS: ' \
'--block-coinbase=[The coinbase of the block]:ADDRESS: ' \
'--block-timestamp=[The timestamp of the block]:TIMESTAMP: ' \
'--block-number=[The block number]:BLOCK: ' \
'--block-difficulty=[The block difficulty]:DIFFICULTY: ' \
'--block-prevrandao=[The block prevrandao value. NOTE\: Before merge this field was mix_hash]:PREVRANDAO: ' \
'--block-gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--memory-limit=[The memory limit of the EVM in bytes (32 MB by default)]:MEMORY_LIMIT: ' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'--ir-minimum[Enable viaIR with minimum optimization]' \
'--no-storage-caching[Explicitly disables the use of RPC caching]' \
'--ffi[Enable the FFI cheatcode]' \
'*-v[Verbosity of the EVM.]' \
'*--verbosity[Verbosity of the EVM.]' \
'--no-rpc-rate-limit[Disables rate limiting for this node'\''s provider]' \
'--no-rate-limit[Disables rate limiting for this node'\''s provider]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(bind)
_arguments "${_arguments_options[@]}" \
'-b+[Path to where the contract artifacts are stored]:PATH:_files -/' \
'--bindings-path=[Path to where the contract artifacts are stored]:PATH:_files -/' \
'*--select=[Create bindings only for contracts whose names match the specified filter(s)]:SELECT: ' \
'(--select)*--skip=[Create bindings only for contracts whose names do not match the specified filter(s)]:SKIP: ' \
'--crate-name=[The name of the Rust crate to generate]:NAME: ' \
'--crate-version=[The version of the Rust crate to generate]:VERSION: ' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'(--select --skip)--select-all[Explicitly generate bindings for all contracts]' \
'--module[Generate the bindings as a module instead of a crate]' \
'--overwrite[Overwrite existing generated bindings]' \
'--single-file[Generate bindings as a single file]' \
'--skip-cargo-toml[Skip Cargo.toml consistency checks]' \
'--skip-build[Skips running forge build before generating binding]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" \
'*--skip=[Skip building files whose names contain the given filter]:SKIP: ' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'*-w+[Watch the given files or directories for changes]' \
'*--watch=[Watch the given files or directories for changes]' \
'--watch-delay=[File update debounce delay]:DELAY: ' \
'--names[Print compiled contract names]' \
'--sizes[Print compiled contract sizes]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'--no-restart[Do not restart the command while it'\''s still running]' \
'--run-all[Explicitly re-run all tests when a change is made]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(debug)
_arguments "${_arguments_options[@]}" \
'--target-contract=[The name of the contract you want to run]:CONTRACT_NAME: ' \
'--tc=[The name of the contract you want to run]:CONTRACT_NAME: ' \
'-s+[The signature of the function you want to call in the contract, or raw calldata]:SIGNATURE: ' \
'--sig=[The signature of the function you want to call in the contract, or raw calldata]:SIGNATURE: ' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'-f+[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--rpc-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-block-number=[Fetch state from a specific block number over a remote endpoint]:BLOCK: ' \
'--fork-retry-backoff=[Initial retry backoff on encountering errors]:BACKOFF: ' \
'--initial-balance=[The initial balance of deployed test contracts]:BALANCE: ' \
'--sender=[The address which will be executing tests]:ADDRESS: ' \
'--compute-units-per-second=[Sets the number of assumed available compute units per second for this provider]:CUPS: ' \
'--gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--code-size-limit=[EIP-170\: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)]:CODE_SIZE: ' \
'--chain-id=[The chain ID]:CHAIN_ID: ' \
'--gas-price=[The gas price]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[The base fee in a block]:FEE: ' \
'--base-fee=[The base fee in a block]:FEE: ' \
'--tx-origin=[The transaction origin]:ADDRESS: ' \
'--block-coinbase=[The coinbase of the block]:ADDRESS: ' \
'--block-timestamp=[The timestamp of the block]:TIMESTAMP: ' \
'--block-number=[The block number]:BLOCK: ' \
'--block-difficulty=[The block difficulty]:DIFFICULTY: ' \
'--block-prevrandao=[The block prevrandao value. NOTE\: Before merge this field was mix_hash]:PREVRANDAO: ' \
'--block-gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--memory-limit=[The memory limit of the EVM in bytes (32 MB by default)]:MEMORY_LIMIT: ' \
'--debug[Open the script in the debugger]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'--no-storage-caching[Explicitly disables the use of RPC caching]' \
'--ffi[Enable the FFI cheatcode]' \
'*-v[Verbosity of the EVM.]' \
'*--verbosity[Verbosity of the EVM.]' \
'--no-rpc-rate-limit[Disables rate limiting for this node'\''s provider]' \
'--no-rate-limit[Disables rate limiting for this node'\''s provider]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':path -- The contract you want to run. Either the file path or contract name:_files' \
'*::args -- Arguments to pass to the script function:' \
&& ret=0
;;
(update)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-f[Override the up-to-date check]' \
'--force[Override the up-to-date check]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::dependencies -- The dependencies you want to update:' \
&& ret=0
;;
(install)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'--shallow[Perform shallow clones instead of deep ones]' \
'--no-git[Install without adding the dependency as a submodule]' \
'--no-commit[Do not create a commit]' \
'-q[Do not print any messages]' \
'--quiet[Do not print any messages]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::dependencies -- The dependencies to install:' \
&& ret=0
;;
(remove)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-f[Override the up-to-date check]' \
'--force[Override the up-to-date check]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::dependencies -- The dependencies you want to remove:' \
&& ret=0
;;
(remappings)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'--pretty[Pretty-print the remappings, grouping each of them by context]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(verify-contract)
_arguments "${_arguments_options[@]}" \
'(--constructor-args-path)--constructor-args=[The ABI-encoded constructor arguments]:ARGS: ' \
'--constructor-args-path=[The path to a file containing the constructor arguments]:PATH:_files' \
'--compiler-version=[The \`solc\` version to use to build the smart contract]:VERSION: ' \
'--num-of-optimizations=[The number of optimization runs used to build the smart contract]:NUM: ' \
'--optimizer-runs=[The number of optimization runs used to build the smart contract]:NUM: ' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-e+[The Etherscan (or equivalent) API key]:KEY: ' \
'--etherscan-api-key=[The Etherscan (or equivalent) API key]:KEY: ' \
'-c+[The chain name or EIP-155 chain ID]:CHAIN: ' \
'--chain=[The chain name or EIP-155 chain ID]:CHAIN: ' \
'--retries=[Number of attempts for retrying verification]:RETRIES: ' \
'--delay=[Optional delay to apply inbetween verification attempts, in seconds]:DELAY: ' \
'--verifier=[The contract verification provider to use]:VERIFIER:(etherscan sourcify blockscout)' \
'--verifier-url=[The verifier URL, if using a custom provider]:VERIFIER_URL: ' \
'--flatten[Flatten the source code before verifying]' \
'-f[Do not compile the flattened smart contract before verifying (if --flatten is passed)]' \
'--force[Do not compile the flattened smart contract before verifying (if --flatten is passed)]' \
'--watch[Wait for verification result after submission]' \
'(--flatten)--show-standard-json-input[Prints the standard json compiler input]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':address -- The address of the contract to verify:' \
':contract -- The contract identifier in the form `<path>\:<contractname>`:' \
&& ret=0
;;
(verify-check)
_arguments "${_arguments_options[@]}" \
'--retries=[Number of attempts for retrying verification]:RETRIES: ' \
'--delay=[Optional delay to apply inbetween verification attempts, in seconds]:DELAY: ' \
'-e+[The Etherscan (or equivalent) API key]:KEY: ' \
'--etherscan-api-key=[The Etherscan (or equivalent) API key]:KEY: ' \
'-c+[The chain name or EIP-155 chain ID]:CHAIN: ' \
'--chain=[The chain name or EIP-155 chain ID]:CHAIN: ' \
'--verifier=[The contract verification provider to use]:VERIFIER:(etherscan sourcify blockscout)' \
'--verifier-url=[The verifier URL, if using a custom provider]:VERIFIER_URL: ' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':id -- The verification ID:' \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" \
'(--constructor-args-path)*--constructor-args=[The constructor arguments]:ARGS: ' \
'--constructor-args-path=[The path to a file containing the constructor arguments]:PATH:_files' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'--gas-limit=[Gas limit for the transaction]:GAS_LIMIT: ' \
'--gas-price=[Gas price for legacy transactions, or max fee per gas for EIP1559 transactions]:PRICE: ' \
'--priority-gas-price=[Max priority fee per gas for EIP1559 transactions]:PRICE: ' \
'--value=[Ether to send in the transaction, either specified in wei, or as a string with a unit type]:VALUE: ' \
'--nonce=[Nonce for the transaction]:NONCE: ' \
'-r+[The RPC endpoint]:URL: ' \
'--rpc-url=[The RPC endpoint]:URL: ' \
'-e+[The Etherscan (or equivalent) API key]:KEY: ' \
'--etherscan-api-key=[The Etherscan (or equivalent) API key]:KEY: ' \
'-c+[The chain name or EIP-155 chain ID]:CHAIN: ' \
'--chain=[The chain name or EIP-155 chain ID]:CHAIN: ' \
'-f+[The sender account]:ADDRESS: ' \
'--from=[The sender account]:ADDRESS: ' \
'--private-key=[Use the provided private key]:RAW_PRIVATE_KEY: ' \
'--mnemonic=[Use the mnemonic phrase of mnemonic file at the specified path]:MNEMONIC: ' \
'--mnemonic-passphrase=[Use a BIP39 passphrase for the mnemonic]:PASSPHRASE: ' \
'--mnemonic-derivation-path=[The wallet derivation path]:PATH: ' \
'(--mnemonic-derivation-path)--mnemonic-index=[Use the private key from the given mnemonic index]:INDEX: ' \
'--keystore=[Use the keystore in the given folder or file]:PATH: ' \
'--password=[The keystore password]:PASSWORD: ' \
'--password-file=[The keystore password file path]:PASSWORD_FILE: ' \
'--verifier=[The contract verification provider to use]:VERIFIER:(etherscan sourcify blockscout)' \
'--verifier-url=[The verifier URL, if using a custom provider]:VERIFIER_URL: ' \
'--retries=[Number of attempts for retrying verification]:RETRIES: ' \
'--delay=[Optional delay to apply inbetween verification attempts, in seconds]:DELAY: ' \
'--json[Print the deployment information as JSON]' \
'--verify[Verify contract after creation]' \
'--unlocked[Send via \`eth_sendTransaction\` using the \`--from\` argument or \`\$ETH_FROM\` as sender]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'--legacy[Send a legacy transaction instead of an EIP1559 transaction]' \
'--flashbots[Use the Flashbots RPC URL (https\://rpc.flashbots.net)]' \
'-i[Open an interactive prompt to enter your private key]' \
'--interactive[Open an interactive prompt to enter your private key]' \
'-l[Use a Ledger hardware wallet]' \
'--ledger[Use a Ledger hardware wallet]' \
'-t[Use a Trezor hardware wallet]' \
'--trezor[Use a Trezor hardware wallet]' \
'--aws[Use AWS Key Management Service]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':contract -- The contract identifier in the form `<path>\:<contractname>`:' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" \
'-t+[The template to start from]:TEMPLATE: ' \
'--template=[The template to start from]:TEMPLATE: ' \
'(-t --template)--offline[Do not install dependencies from the network]' \
'(-t --template)--no-deps[Do not install dependencies from the network]' \
'(-t --template)--force[Create the project even if the specified root directory is not empty]' \
'(-t --template)--vscode[Create a .vscode/settings.json file with Solidity settings, and generate a remappings.txt file]' \
'--shallow[Perform shallow clones instead of deep ones]' \
'--no-git[Install without adding the dependency as a submodule]' \
'--no-commit[Do not create a commit]' \
'-q[Do not print any messages]' \
'--quiet[Do not print any messages]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::root -- The root directory of the new project:_files -/' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
':shell:(bash elvish fish powershell zsh)' \
&& ret=0
;;
(generate-fig-spec)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(clean)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(cache)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
":: :_forge__cache_commands" \
"*::: :->cache" \
&& ret=0

    case $state in
    (cache)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:forge-cache-command-$line[1]:"
        case $line[1] in
            (clean)
_arguments "${_arguments_options[@]}" \
'*-b+[The blocks to clean the cache for]:BLOCKS: ' \
'*--blocks=[The blocks to clean the cache for]:BLOCKS: ' \
'--etherscan[Whether to clean the Etherscan cache]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::chains -- The chains to clean the cache for:' \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::chains -- The chains to list the cache for:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_forge__cache__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:forge-cache-help-command-$line[1]:"
        case $line[1] in
            (clean)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(snapshot)
_arguments "${_arguments_options[@]}" \
'(--snap)--diff=[Output a diff against a pre-existing snapshot]' \
'(--diff)--check=[Compare against a pre-existing snapshot, exiting with code 1 if they do not match]' \
'--format=[How to format the output]:FORMAT: ' \
'--snap=[Output file for the snapshot]:FILE:_files' \
'--tolerance=[Tolerates gas deviations up to the specified percentage]:SNAPSHOT_THRESHOLD: ' \
'--debug=[Run a test in the debugger]:TEST_FUNCTION: ' \
'--etherscan-api-key=[The Etherscan (or equivalent) API key]:KEY: ' \
'--fuzz-seed=[Set seed used to generate randomness during your fuzz runs]:FUZZ_SEED: ' \
'--fuzz-runs=[]:RUNS: ' \
'--match-test=[Only run test functions matching the specified regex pattern]:REGEX: ' \
'--mt=[Only run test functions matching the specified regex pattern]:REGEX: ' \
'--no-match-test=[Only run test functions that do not match the specified regex pattern]:REGEX: ' \
'--nmt=[Only run test functions that do not match the specified regex pattern]:REGEX: ' \
'--match-contract=[Only run tests in contracts matching the specified regex pattern]:REGEX: ' \
'--mc=[Only run tests in contracts matching the specified regex pattern]:REGEX: ' \
'--no-match-contract=[Only run tests in contracts that do not match the specified regex pattern]:REGEX: ' \
'--nmc=[Only run tests in contracts that do not match the specified regex pattern]:REGEX: ' \
'--match-path=[Only run tests in source files matching the specified glob pattern]:GLOB: ' \
'--mp=[Only run tests in source files matching the specified glob pattern]:GLOB: ' \
'--no-match-path=[Only run tests in source files that do not match the specified glob pattern]:GLOB: ' \
'--nmp=[Only run tests in source files that do not match the specified glob pattern]:GLOB: ' \
'-f+[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--rpc-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-block-number=[Fetch state from a specific block number over a remote endpoint]:BLOCK: ' \
'--fork-retry-backoff=[Initial retry backoff on encountering errors]:BACKOFF: ' \
'--initial-balance=[The initial balance of deployed test contracts]:BALANCE: ' \
'--sender=[The address which will be executing tests]:ADDRESS: ' \
'--compute-units-per-second=[Sets the number of assumed available compute units per second for this provider]:CUPS: ' \
'--gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--code-size-limit=[EIP-170\: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)]:CODE_SIZE: ' \
'--chain-id=[The chain ID]:CHAIN_ID: ' \
'--gas-price=[The gas price]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[The base fee in a block]:FEE: ' \
'--base-fee=[The base fee in a block]:FEE: ' \
'--tx-origin=[The transaction origin]:ADDRESS: ' \
'--block-coinbase=[The coinbase of the block]:ADDRESS: ' \
'--block-timestamp=[The timestamp of the block]:TIMESTAMP: ' \
'--block-number=[The block number]:BLOCK: ' \
'--block-difficulty=[The block difficulty]:DIFFICULTY: ' \
'--block-prevrandao=[The block prevrandao value. NOTE\: Before merge this field was mix_hash]:PREVRANDAO: ' \
'--block-gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--memory-limit=[The memory limit of the EVM in bytes (32 MB by default)]:MEMORY_LIMIT: ' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'*-w+[Watch the given files or directories for changes]' \
'*--watch=[Watch the given files or directories for changes]' \
'--watch-delay=[File update debounce delay]:DELAY: ' \
'--min=[Only include tests that used more gas that the given amount]:MIN_GAS: ' \
'--max=[Only include tests that used less gas that the given amount]:MAX_GAS: ' \
'--gas-report[Print a gas report]' \
'--allow-failure[Exit with code 0 even if a test fails]' \
'-j[Output test results in JSON format]' \
'--json[Output test results in JSON format]' \
'--fail-fast[Stop running tests after the first failure]' \
'-l[List tests instead of running them]' \
'--list[List tests instead of running them]' \
'--no-storage-caching[Explicitly disables the use of RPC caching]' \
'--ffi[Enable the FFI cheatcode]' \
'*-v[Verbosity of the EVM.]' \
'*--verbosity[Verbosity of the EVM.]' \
'--no-rpc-rate-limit[Disables rate limiting for this node'\''s provider]' \
'--no-rate-limit[Disables rate limiting for this node'\''s provider]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'--no-restart[Do not restart the command while it'\''s still running]' \
'--run-all[Explicitly re-run all tests when a change is made]' \
'--asc[Sort results by gas used (ascending)]' \
'(--asc)--desc[Sort results by gas used (descending)]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" \
'*--skip=[Skip building files whose names contain the given filter]:SKIP: ' \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'*-w+[Watch the given files or directories for changes]' \
'*--watch=[Watch the given files or directories for changes]' \
'--watch-delay=[File update debounce delay]:DELAY: ' \
'-f+[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--rpc-url=[Fetch state over a remote endpoint instead of starting from an empty state]:URL: ' \
'--fork-block-number=[Fetch state from a specific block number over a remote endpoint]:BLOCK: ' \
'--fork-retry-backoff=[Initial retry backoff on encountering errors]:BACKOFF: ' \
'--initial-balance=[The initial balance of deployed test contracts]:BALANCE: ' \
'--sender=[The address which will be executing tests]:ADDRESS: ' \
'--compute-units-per-second=[Sets the number of assumed available compute units per second for this provider]:CUPS: ' \
'--gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--code-size-limit=[EIP-170\: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)]:CODE_SIZE: ' \
'--chain-id=[The chain ID]:CHAIN_ID: ' \
'--gas-price=[The gas price]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[The base fee in a block]:FEE: ' \
'--base-fee=[The base fee in a block]:FEE: ' \
'--tx-origin=[The transaction origin]:ADDRESS: ' \
'--block-coinbase=[The coinbase of the block]:ADDRESS: ' \
'--block-timestamp=[The timestamp of the block]:TIMESTAMP: ' \
'--block-number=[The block number]:BLOCK: ' \
'--block-difficulty=[The block difficulty]:DIFFICULTY: ' \
'--block-prevrandao=[The block prevrandao value. NOTE\: Before merge this field was mix_hash]:PREVRANDAO: ' \
'--block-gas-limit=[The block gas limit]:GAS_LIMIT: ' \
'--memory-limit=[The memory limit of the EVM in bytes (32 MB by default)]:MEMORY_LIMIT: ' \
'--basic[Print only a basic set of the currently set config values]' \
'--json[Print currently set config values as JSON]' \
'--fix[Attempt to fix any configuration warnings]' \
'--names[Print compiled contract names]' \
'--sizes[Print compiled contract sizes]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'--no-restart[Do not restart the command while it'\''s still running]' \
'--run-all[Explicitly re-run all tests when a change is made]' \
'--no-storage-caching[Explicitly disables the use of RPC caching]' \
'--ffi[Enable the FFI cheatcode]' \
'*-v[Verbosity of the EVM.]' \
'*--verbosity[Verbosity of the EVM.]' \
'--no-rpc-rate-limit[Disables rate limiting for this node'\''s provider]' \
'--no-rate-limit[Disables rate limiting for this node'\''s provider]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(flatten)
_arguments "${_arguments_options[@]}" \
'-o+[The path to output the flattened contract]:PATH:_files' \
'--output=[The path to output the flattened contract]:PATH:_files' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':target_path -- The path to the contract to flatten:_files' \
&& ret=0
;;
(fmt)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'--check[Run in '\''check'\'' mode]' \
'-r[In '\''check'\'' and stdin modes, outputs raw formatted code instead of the diff]' \
'--raw[In '\''check'\'' and stdin modes, outputs raw formatted code instead of the diff]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Path to the file, directory or '\''-'\'' to read from stdin:_files' \
&& ret=0
;;
(inspect)
_arguments "${_arguments_options[@]}" \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'--pretty[Pretty print the selected field, if supported]' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':contract -- The identifier of the contract to inspect in the form `(<path>\:)?<contractname>`:' \
':field -- The contract artifact field to inspect:(abi bytecode deployedBytecode assembly assemblyOptimized methodIdentifiers gasEstimates storageLayout devdoc ir irOptimized metadata userdoc ewasm errors events)' \
&& ret=0
;;
(upload-selectors)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'--all[Upload selectors for all contracts in the project]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::contract -- The name of the contract to upload selectors for:' \
&& ret=0
;;
(tree)
_arguments "${_arguments_options[@]}" \
'--charset=[Character set to use in output]:CHARSET: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'--no-dedupe[Do not de-duplicate (repeats all shared dependencies)]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(geiger)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'*--ignore=[Globs to ignore]:PATH:_files' \
'--check[Run in "check" mode]' \
'--full[Print a report of all files, even if no unsafe functions are found]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Paths to files or directories to detect:_files' \
&& ret=0
;;
(doc)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-o+[The doc'\''s output path]:PATH:_files -/' \
'--out=[The doc'\''s output path]:PATH:_files -/' \
'--hostname=[Hostname for serving documentation]:HOSTNAME: ' \
'-p+[Port for serving documentation]:PORT: ' \
'--port=[Port for serving documentation]:PORT: ' \
'--deployments=[The relative path to the \`hardhat-deploy\` or \`forge-deploy\` artifact directory. Leave blank for default]' \
'-b[Build the \`mdbook\` from generated files]' \
'--build[Build the \`mdbook\` from generated files]' \
'-s[Serve the documentation]' \
'--serve[Serve the documentation]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(selectors)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
":: :_forge__selectors_commands" \
"*::: :->selectors" \
&& ret=0

    case $state in
    (selectors)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:forge-selectors-command-$line[1]:"
        case $line[1] in
            (collision)
_arguments "${_arguments_options[@]}" \
'*--libraries=[Set pre-linked libraries]:LIBRARIES: ' \
'*--ignored-error-codes=[Ignore solc warnings by error code]:ERROR_CODES: ' \
'--use=[Specify the solc version, or a path to a local solc, to build with]:SOLC_VERSION: ' \
'-o+[The path to the contract artifacts folder]:PATH:_files -/' \
'--out=[The path to the contract artifacts folder]:PATH:_files -/' \
'--revert-strings=[Revert string configuration]:REVERT: ' \
'--build-info-path=[Output path to directory that build info files will be written to]:PATH:_files -/' \
'--evm-version=[The target EVM version]:VERSION: ' \
'--optimizer-runs=[The number of optimizer runs]:RUNS: ' \
'*--extra-output=[Extra output to include in the contract'\''s artifact]:SELECTOR: ' \
'*--extra-output-files=[Extra output to write to separate files]:SELECTOR: ' \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'--force[Clear the cache and artifacts folder and recompile]' \
'--deny-warnings[Warnings will trigger a compiler error]' \
'--no-auto-detect[Do not auto-detect the \`solc\` version]' \
'--offline[Do not access the network]' \
'--via-ir[Use the Yul intermediate representation compilation pipeline]' \
'--silent[Don'\''t print anything on startup]' \
'--build-info[Generate build info files]' \
'--optimize[Activate the Solidity optimizer]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':first_contract -- The first of the two contracts for which to look selector collisions for, in the form `(<path>\:)?<contractname>`:' \
':second_contract -- The second of the two contracts for which to look selector collisions for, in the form `(<path>\:)?<contractname>`:' \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" \
'--root=[The project'\''s root path]:PATH:_files -/' \
'-C+[The contracts source directory]:PATH:_files -/' \
'--contracts=[The contracts source directory]:PATH:_files -/' \
'*-R+[The project'\''s remappings]:REMAPPINGS: ' \
'*--remappings=[The project'\''s remappings]:REMAPPINGS: ' \
'--remappings-env=[The project'\''s remappings from the environment]:ENV: ' \
'--cache-path=[The path to the compiler cache]:PATH:_files -/' \
'*--lib-paths=[The path to the library folder]:PATH:_files -/' \
'--config-path=[Path to the config file]:FILE:_files' \
'--all[Upload selectors for all contracts in the project]' \
'(-C --contracts)--hardhat[Use the Hardhat-style project layout]' \
'(-C --contracts)--hh[Use the Hardhat-style project layout]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::contract -- The name of the contract to upload selectors for:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_forge__selectors__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:forge-selectors-help-command-$line[1]:"
        case $line[1] in
            (collision)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_forge__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:forge-help-command-$line[1]:"
        case $line[1] in
            (test)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(script)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(coverage)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(bind)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(debug)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(update)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(install)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(remove)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(remappings)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(verify-contract)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(verify-check)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(generate-fig-spec)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(clean)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(cache)
_arguments "${_arguments_options[@]}" \
":: :_forge__help__cache_commands" \
"*::: :->cache" \
&& ret=0

    case $state in
    (cache)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:forge-help-cache-command-$line[1]:"
        case $line[1] in
            (clean)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(snapshot)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(flatten)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(fmt)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(inspect)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(upload-selectors)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(tree)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(geiger)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(doc)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(selectors)
_arguments "${_arguments_options[@]}" \
":: :_forge__help__selectors_commands" \
"*::: :->selectors" \
&& ret=0

    case $state in
    (selectors)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:forge-help-selectors-command-$line[1]:"
        case $line[1] in
            (collision)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(upload)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_forge_commands] )) ||
_forge_commands() {
    local commands; commands=(
'test:Run the project'\''s tests' \
't:Run the project'\''s tests' \
'script:Run a smart contract as a script, building transactions that can be sent onchain' \
'coverage:Generate coverage reports' \
'bind:Generate Rust bindings for smart contracts' \
'build:Build the project'\''s smart contracts' \
'b:Build the project'\''s smart contracts' \
'compile:Build the project'\''s smart contracts' \
'debug:Debugs a single smart contract as a script' \
'd:Debugs a single smart contract as a script' \
'update:Update one or multiple dependencies' \
'u:Update one or multiple dependencies' \
'install:Install one or multiple dependencies' \
'i:Install one or multiple dependencies' \
'remove:Remove one or multiple dependencies' \
'rm:Remove one or multiple dependencies' \
'remappings:Get the automatically inferred remappings for the project' \
're:Get the automatically inferred remappings for the project' \
'verify-contract:Verify smart contracts on Etherscan' \
'v:Verify smart contracts on Etherscan' \
'verify-check:Check verification status on Etherscan' \
'vc:Check verification status on Etherscan' \
'create:Deploy a smart contract' \
'c:Deploy a smart contract' \
'init:Create a new Forge project' \
'completions:Generate shell completions script' \
'com:Generate shell completions script' \
'generate-fig-spec:Generate Fig autocompletion spec' \
'fig:Generate Fig autocompletion spec' \
'clean:Remove the build artifacts and cache directories' \
'cl:Remove the build artifacts and cache directories' \
'cache:Manage the Foundry cache' \
'snapshot:Create a snapshot of each test'\''s gas usage' \
's:Create a snapshot of each test'\''s gas usage' \
'config:Display the current config' \
'co:Display the current config' \
'flatten:Flatten a source file and all of its imports into one file' \
'f:Flatten a source file and all of its imports into one file' \
'fmt:Format Solidity source files' \
'inspect:Get specialized information about a smart contract' \
'in:Get specialized information about a smart contract' \
'upload-selectors:Uploads abi of given contract to the https\://api.openchain.xyz function selector database' \
'up:Uploads abi of given contract to the https\://api.openchain.xyz function selector database' \
'tree:Display a tree visualization of the project'\''s dependency graph' \
'tr:Display a tree visualization of the project'\''s dependency graph' \
'geiger:Detects usage of unsafe cheat codes in a project and its dependencies' \
'doc:Generate documentation for the project' \
'selectors:Function selector utilities' \
'se:Function selector utilities' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'forge commands' commands "$@"
}
(( $+functions[_forge__bind_commands] )) ||
_forge__bind_commands() {
    local commands; commands=()
    _describe -t commands 'forge bind commands' commands "$@"
}
(( $+functions[_forge__help__bind_commands] )) ||
_forge__help__bind_commands() {
    local commands; commands=()
    _describe -t commands 'forge help bind commands' commands "$@"
}
(( $+functions[_forge__build_commands] )) ||
_forge__build_commands() {
    local commands; commands=()
    _describe -t commands 'forge build commands' commands "$@"
}
(( $+functions[_forge__help__build_commands] )) ||
_forge__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'forge help build commands' commands "$@"
}
(( $+functions[_forge__cache_commands] )) ||
_forge__cache_commands() {
    local commands; commands=(
'clean:Cleans cached data from the global foundry directory' \
'ls:Shows cached data from the global foundry directory' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'forge cache commands' commands "$@"
}
(( $+functions[_forge__help__cache_commands] )) ||
_forge__help__cache_commands() {
    local commands; commands=(
'clean:Cleans cached data from the global foundry directory' \
'ls:Shows cached data from the global foundry directory' \
    )
    _describe -t commands 'forge help cache commands' commands "$@"
}
(( $+functions[_forge__cache__clean_commands] )) ||
_forge__cache__clean_commands() {
    local commands; commands=()
    _describe -t commands 'forge cache clean commands' commands "$@"
}
(( $+functions[_forge__cache__help__clean_commands] )) ||
_forge__cache__help__clean_commands() {
    local commands; commands=()
    _describe -t commands 'forge cache help clean commands' commands "$@"
}
(( $+functions[_forge__clean_commands] )) ||
_forge__clean_commands() {
    local commands; commands=()
    _describe -t commands 'forge clean commands' commands "$@"
}
(( $+functions[_forge__help__cache__clean_commands] )) ||
_forge__help__cache__clean_commands() {
    local commands; commands=()
    _describe -t commands 'forge help cache clean commands' commands "$@"
}
(( $+functions[_forge__help__clean_commands] )) ||
_forge__help__clean_commands() {
    local commands; commands=()
    _describe -t commands 'forge help clean commands' commands "$@"
}
(( $+functions[_forge__help__selectors__collision_commands] )) ||
_forge__help__selectors__collision_commands() {
    local commands; commands=()
    _describe -t commands 'forge help selectors collision commands' commands "$@"
}
(( $+functions[_forge__selectors__collision_commands] )) ||
_forge__selectors__collision_commands() {
    local commands; commands=()
    _describe -t commands 'forge selectors collision commands' commands "$@"
}
(( $+functions[_forge__selectors__help__collision_commands] )) ||
_forge__selectors__help__collision_commands() {
    local commands; commands=()
    _describe -t commands 'forge selectors help collision commands' commands "$@"
}
(( $+functions[_forge__completions_commands] )) ||
_forge__completions_commands() {
    local commands; commands=()
    _describe -t commands 'forge completions commands' commands "$@"
}
(( $+functions[_forge__help__completions_commands] )) ||
_forge__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'forge help completions commands' commands "$@"
}
(( $+functions[_forge__config_commands] )) ||
_forge__config_commands() {
    local commands; commands=()
    _describe -t commands 'forge config commands' commands "$@"
}
(( $+functions[_forge__help__config_commands] )) ||
_forge__help__config_commands() {
    local commands; commands=()
    _describe -t commands 'forge help config commands' commands "$@"
}
(( $+functions[_forge__coverage_commands] )) ||
_forge__coverage_commands() {
    local commands; commands=()
    _describe -t commands 'forge coverage commands' commands "$@"
}
(( $+functions[_forge__help__coverage_commands] )) ||
_forge__help__coverage_commands() {
    local commands; commands=()
    _describe -t commands 'forge help coverage commands' commands "$@"
}
(( $+functions[_forge__create_commands] )) ||
_forge__create_commands() {
    local commands; commands=()
    _describe -t commands 'forge create commands' commands "$@"
}
(( $+functions[_forge__help__create_commands] )) ||
_forge__help__create_commands() {
    local commands; commands=()
    _describe -t commands 'forge help create commands' commands "$@"
}
(( $+functions[_forge__debug_commands] )) ||
_forge__debug_commands() {
    local commands; commands=()
    _describe -t commands 'forge debug commands' commands "$@"
}
(( $+functions[_forge__help__debug_commands] )) ||
_forge__help__debug_commands() {
    local commands; commands=()
    _describe -t commands 'forge help debug commands' commands "$@"
}
(( $+functions[_forge__doc_commands] )) ||
_forge__doc_commands() {
    local commands; commands=()
    _describe -t commands 'forge doc commands' commands "$@"
}
(( $+functions[_forge__help__doc_commands] )) ||
_forge__help__doc_commands() {
    local commands; commands=()
    _describe -t commands 'forge help doc commands' commands "$@"
}
(( $+functions[_forge__flatten_commands] )) ||
_forge__flatten_commands() {
    local commands; commands=()
    _describe -t commands 'forge flatten commands' commands "$@"
}
(( $+functions[_forge__help__flatten_commands] )) ||
_forge__help__flatten_commands() {
    local commands; commands=()
    _describe -t commands 'forge help flatten commands' commands "$@"
}
(( $+functions[_forge__fmt_commands] )) ||
_forge__fmt_commands() {
    local commands; commands=()
    _describe -t commands 'forge fmt commands' commands "$@"
}
(( $+functions[_forge__help__fmt_commands] )) ||
_forge__help__fmt_commands() {
    local commands; commands=()
    _describe -t commands 'forge help fmt commands' commands "$@"
}
(( $+functions[_forge__geiger_commands] )) ||
_forge__geiger_commands() {
    local commands; commands=()
    _describe -t commands 'forge geiger commands' commands "$@"
}
(( $+functions[_forge__help__geiger_commands] )) ||
_forge__help__geiger_commands() {
    local commands; commands=()
    _describe -t commands 'forge help geiger commands' commands "$@"
}
(( $+functions[_forge__generate-fig-spec_commands] )) ||
_forge__generate-fig-spec_commands() {
    local commands; commands=()
    _describe -t commands 'forge generate-fig-spec commands' commands "$@"
}
(( $+functions[_forge__help__generate-fig-spec_commands] )) ||
_forge__help__generate-fig-spec_commands() {
    local commands; commands=()
    _describe -t commands 'forge help generate-fig-spec commands' commands "$@"
}
(( $+functions[_forge__cache__help_commands] )) ||
_forge__cache__help_commands() {
    local commands; commands=(
'clean:Cleans cached data from the global foundry directory' \
'ls:Shows cached data from the global foundry directory' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'forge cache help commands' commands "$@"
}
(( $+functions[_forge__cache__help__help_commands] )) ||
_forge__cache__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'forge cache help help commands' commands "$@"
}
(( $+functions[_forge__help_commands] )) ||
_forge__help_commands() {
    local commands; commands=(
'test:Run the project'\''s tests' \
'script:Run a smart contract as a script, building transactions that can be sent onchain' \
'coverage:Generate coverage reports' \
'bind:Generate Rust bindings for smart contracts' \
'build:Build the project'\''s smart contracts' \
'debug:Debugs a single smart contract as a script' \
'update:Update one or multiple dependencies' \
'install:Install one or multiple dependencies' \
'remove:Remove one or multiple dependencies' \
'remappings:Get the automatically inferred remappings for the project' \
'verify-contract:Verify smart contracts on Etherscan' \
'verify-check:Check verification status on Etherscan' \
'create:Deploy a smart contract' \
'init:Create a new Forge project' \
'completions:Generate shell completions script' \
'generate-fig-spec:Generate Fig autocompletion spec' \
'clean:Remove the build artifacts and cache directories' \
'cache:Manage the Foundry cache' \
'snapshot:Create a snapshot of each test'\''s gas usage' \
'config:Display the current config' \
'flatten:Flatten a source file and all of its imports into one file' \
'fmt:Format Solidity source files' \
'inspect:Get specialized information about a smart contract' \
'upload-selectors:Uploads abi of given contract to the https\://api.openchain.xyz function selector database' \
'tree:Display a tree visualization of the project'\''s dependency graph' \
'geiger:Detects usage of unsafe cheat codes in a project and its dependencies' \
'doc:Generate documentation for the project' \
'selectors:Function selector utilities' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'forge help commands' commands "$@"
}
(( $+functions[_forge__help__help_commands] )) ||
_forge__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'forge help help commands' commands "$@"
}
(( $+functions[_forge__selectors__help_commands] )) ||
_forge__selectors__help_commands() {
    local commands; commands=(
'collision:Check for selector collisions between contracts' \
'upload:Upload selectors to registry' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'forge selectors help commands' commands "$@"
}
(( $+functions[_forge__selectors__help__help_commands] )) ||
_forge__selectors__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'forge selectors help help commands' commands "$@"
}
(( $+functions[_forge__help__init_commands] )) ||
_forge__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'forge help init commands' commands "$@"
}
(( $+functions[_forge__init_commands] )) ||
_forge__init_commands() {
    local commands; commands=()
    _describe -t commands 'forge init commands' commands "$@"
}
(( $+functions[_forge__help__inspect_commands] )) ||
_forge__help__inspect_commands() {
    local commands; commands=()
    _describe -t commands 'forge help inspect commands' commands "$@"
}
(( $+functions[_forge__inspect_commands] )) ||
_forge__inspect_commands() {
    local commands; commands=()
    _describe -t commands 'forge inspect commands' commands "$@"
}
(( $+functions[_forge__help__install_commands] )) ||
_forge__help__install_commands() {
    local commands; commands=()
    _describe -t commands 'forge help install commands' commands "$@"
}
(( $+functions[_forge__install_commands] )) ||
_forge__install_commands() {
    local commands; commands=()
    _describe -t commands 'forge install commands' commands "$@"
}
(( $+functions[_forge__cache__help__ls_commands] )) ||
_forge__cache__help__ls_commands() {
    local commands; commands=()
    _describe -t commands 'forge cache help ls commands' commands "$@"
}
(( $+functions[_forge__cache__ls_commands] )) ||
_forge__cache__ls_commands() {
    local commands; commands=()
    _describe -t commands 'forge cache ls commands' commands "$@"
}
(( $+functions[_forge__help__cache__ls_commands] )) ||
_forge__help__cache__ls_commands() {
    local commands; commands=()
    _describe -t commands 'forge help cache ls commands' commands "$@"
}
(( $+functions[_forge__help__remappings_commands] )) ||
_forge__help__remappings_commands() {
    local commands; commands=()
    _describe -t commands 'forge help remappings commands' commands "$@"
}
(( $+functions[_forge__remappings_commands] )) ||
_forge__remappings_commands() {
    local commands; commands=()
    _describe -t commands 'forge remappings commands' commands "$@"
}
(( $+functions[_forge__help__remove_commands] )) ||
_forge__help__remove_commands() {
    local commands; commands=()
    _describe -t commands 'forge help remove commands' commands "$@"
}
(( $+functions[_forge__remove_commands] )) ||
_forge__remove_commands() {
    local commands; commands=()
    _describe -t commands 'forge remove commands' commands "$@"
}
(( $+functions[_forge__help__script_commands] )) ||
_forge__help__script_commands() {
    local commands; commands=()
    _describe -t commands 'forge help script commands' commands "$@"
}
(( $+functions[_forge__script_commands] )) ||
_forge__script_commands() {
    local commands; commands=()
    _describe -t commands 'forge script commands' commands "$@"
}
(( $+functions[_forge__help__selectors_commands] )) ||
_forge__help__selectors_commands() {
    local commands; commands=(
'collision:Check for selector collisions between contracts' \
'upload:Upload selectors to registry' \
    )
    _describe -t commands 'forge help selectors commands' commands "$@"
}
(( $+functions[_forge__selectors_commands] )) ||
_forge__selectors_commands() {
    local commands; commands=(
'collision:Check for selector collisions between contracts' \
'co:Check for selector collisions between contracts' \
'upload:Upload selectors to registry' \
'up:Upload selectors to registry' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'forge selectors commands' commands "$@"
}
(( $+functions[_forge__help__snapshot_commands] )) ||
_forge__help__snapshot_commands() {
    local commands; commands=()
    _describe -t commands 'forge help snapshot commands' commands "$@"
}
(( $+functions[_forge__snapshot_commands] )) ||
_forge__snapshot_commands() {
    local commands; commands=()
    _describe -t commands 'forge snapshot commands' commands "$@"
}
(( $+functions[_forge__help__test_commands] )) ||
_forge__help__test_commands() {
    local commands; commands=()
    _describe -t commands 'forge help test commands' commands "$@"
}
(( $+functions[_forge__test_commands] )) ||
_forge__test_commands() {
    local commands; commands=()
    _describe -t commands 'forge test commands' commands "$@"
}
(( $+functions[_forge__help__tree_commands] )) ||
_forge__help__tree_commands() {
    local commands; commands=()
    _describe -t commands 'forge help tree commands' commands "$@"
}
(( $+functions[_forge__tree_commands] )) ||
_forge__tree_commands() {
    local commands; commands=()
    _describe -t commands 'forge tree commands' commands "$@"
}
(( $+functions[_forge__help__update_commands] )) ||
_forge__help__update_commands() {
    local commands; commands=()
    _describe -t commands 'forge help update commands' commands "$@"
}
(( $+functions[_forge__update_commands] )) ||
_forge__update_commands() {
    local commands; commands=()
    _describe -t commands 'forge update commands' commands "$@"
}
(( $+functions[_forge__help__selectors__upload_commands] )) ||
_forge__help__selectors__upload_commands() {
    local commands; commands=()
    _describe -t commands 'forge help selectors upload commands' commands "$@"
}
(( $+functions[_forge__selectors__help__upload_commands] )) ||
_forge__selectors__help__upload_commands() {
    local commands; commands=()
    _describe -t commands 'forge selectors help upload commands' commands "$@"
}
(( $+functions[_forge__selectors__upload_commands] )) ||
_forge__selectors__upload_commands() {
    local commands; commands=()
    _describe -t commands 'forge selectors upload commands' commands "$@"
}
(( $+functions[_forge__help__upload-selectors_commands] )) ||
_forge__help__upload-selectors_commands() {
    local commands; commands=()
    _describe -t commands 'forge help upload-selectors commands' commands "$@"
}
(( $+functions[_forge__upload-selectors_commands] )) ||
_forge__upload-selectors_commands() {
    local commands; commands=()
    _describe -t commands 'forge upload-selectors commands' commands "$@"
}
(( $+functions[_forge__help__verify-check_commands] )) ||
_forge__help__verify-check_commands() {
    local commands; commands=()
    _describe -t commands 'forge help verify-check commands' commands "$@"
}
(( $+functions[_forge__verify-check_commands] )) ||
_forge__verify-check_commands() {
    local commands; commands=()
    _describe -t commands 'forge verify-check commands' commands "$@"
}
(( $+functions[_forge__help__verify-contract_commands] )) ||
_forge__help__verify-contract_commands() {
    local commands; commands=()
    _describe -t commands 'forge help verify-contract commands' commands "$@"
}
(( $+functions[_forge__verify-contract_commands] )) ||
_forge__verify-contract_commands() {
    local commands; commands=()
    _describe -t commands 'forge verify-contract commands' commands "$@"
}

if [ "$funcstack[1]" = "_forge" ]; then
    _forge "$@"
else
    compdef _forge forge
fi

if [[ $TERM_PROGRAM = "tmux" ]] && [[ -e ./package.json ]] ; then
  setup_nvm &> /dev/null
fi

#compdef pscale
compdef _pscale pscale

# zsh completion for pscale                               -*- shell-script -*-

__pscale_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_pscale()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16
    local shellCompDirectiveKeepOrder=32

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace keepOrder
    local -a completions

    __pscale_debug "\n========= starting completion logic =========="
    __pscale_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __pscale_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __pscale_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., pscale -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __pscale_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __pscale_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __pscale_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __pscale_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __pscale_debug "No directive found.  Setting do default"
        directive=0
    fi

    __pscale_debug "directive: ${directive}"
    __pscale_debug "completions: ${out}"
    __pscale_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __pscale_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __pscale_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __pscale_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __pscale_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __pscale_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __pscale_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveKeepOrder)) -ne 0 ]; then
        __pscale_debug "Activating keep order."
        keepOrder="-V"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __pscale_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __pscale_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __pscale_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __pscale_debug "Calling _describe"
        if eval _describe $keepOrder "completions" completions $flagPrefix $noSpace; then
            __pscale_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __pscale_debug "_describe did not find completions."
            __pscale_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __pscale_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __pscale_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_pscale" ]; then
    _pscale
fi

alias groot="cd \$(git rev-parse --show-toplevel)"


alias disablehistory="function zshaddhistory() {  return 1 }"
alias enablehistory="unset -f zshaddhistory"

eval "$(direnv hook zsh)"

[[ -s "/home/kevin/.gvm/scripts/gvm" ]] && source "/home/kevin/.gvm/scripts/gvm"
#compdef minikube

# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

__minikube_bash_source() {
	alias shopt=':'
	alias _expand=_bash_expand
	alias _complete=_bash_comp
	emulate -L sh
	setopt kshglob noshglob braceexpand
	source "$@"
}
__minikube_type() {
	# -t is not supported by zsh
	if [ "$1" == "-t" ]; then
		shift
		# fake Bash 4 to disable "complete -o nospace". Instead
		# "compopt +-o nospace" is used in the code to toggle trailing
		# spaces. We don't support that, but leave trailing spaces on
		# all the time
		if [ "$1" = "__minikube_compopt" ]; then
			echo builtin
			return 0
		fi
	fi
	type "$@"
}
__minikube_compgen() {
	local completions w
	completions=( $(compgen "$@") ) || return $?
	# filter by given word as prefix
	while [[ "$1" = -* && "$1" != -- ]]; do
		shift
		shift
	done
	if [[ "$1" == -- ]]; then
		shift
	fi
	for w in "${completions[@]}"; do
		if [[ "${w}" = "$1"* ]]; then
			echo "${w}"
		fi
	done
}
__minikube_compopt() {
	true # don't do anything. Not supported by bashcompinit in zsh
}
__minikube_declare() {
	if [ "$1" == "-F" ]; then
		whence -w "$@"
	else
		builtin declare "$@"
	fi
}
__minikube_ltrim_colon_completions()
{
	if [[ "$1" == *:* && "$COMP_WORDBREAKS" == *:* ]]; then
		# Remove colon-word prefix from COMPREPLY items
		local colon_word=${1%${1##*:}}
		local i=${#COMPREPLY[*]}
		while [[ $((--i)) -ge 0 ]]; do
			COMPREPLY[$i]=${COMPREPLY[$i]#"$colon_word"}
		done
	fi
}
__minikube_get_comp_words_by_ref() {
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[${COMP_CWORD}-1]}"
	words=("${COMP_WORDS[@]}")
	cword=("${COMP_CWORD[@]}")
}
__minikube_filedir() {
	local RET OLD_IFS w qw
	__debug "_filedir $@ cur=$cur"
	if [[ "$1" = \~* ]]; then
		# somehow does not work. Maybe, zsh does not call this at all
		eval echo "$1"
		return 0
	fi
	OLD_IFS="$IFS"
	IFS=$'\n'
	if [ "$1" = "-d" ]; then
		shift
		RET=( $(compgen -d) )
	else
		RET=( $(compgen -f) )
	fi
	IFS="$OLD_IFS"
	IFS="," __debug "RET=${RET[@]} len=${#RET[@]}"
	for w in ${RET[@]}; do
		if [[ ! "${w}" = "${cur}"* ]]; then
			continue
		fi
		if eval "[[ \"\${w}\" = *.$1 || -d \"\${w}\" ]]"; then
			qw="$(__minikube_quote "${w}")"
			if [ -d "${w}" ]; then
				COMPREPLY+=("${qw}/")
			else
				COMPREPLY+=("${qw}")
			fi
		fi
	done
}
__minikube_quote() {
	if [[ $1 == \'* || $1 == \"* ]]; then
		# Leave out first character
		printf %q "${1:1}"
	else
		printf %q "$1"
	fi
}
autoload -U +X bashcompinit && bashcompinit
# use word boundary patterns for BSD or GNU sed
LWORD='[[:<:]]'
RWORD='[[:>:]]'
if sed --help 2>&1 | grep -q GNU; then
	LWORD='\<'
	RWORD='\>'
fi
__minikube_convert_bash_to_zsh() {
	sed \
	-e 's/declare -F/whence -w/' \
	-e 's/_get_comp_words_by_ref "\$@"/_get_comp_words_by_ref "\$*"/' \
	-e 's/local \([a-zA-Z0-9_]*\)=/local \1; \1=/' \
	-e 's/flags+=("\(--.*\)=")/flags+=("\1"); two_word_flags+=("\1")/' \
	-e 's/must_have_one_flag+=("\(--.*\)=")/must_have_one_flag+=("\1")/' \
	-e "s/${LWORD}_filedir${RWORD}/__minikube_filedir/g" \
	-e "s/${LWORD}_get_comp_words_by_ref${RWORD}/__minikube_get_comp_words_by_ref/g" \
	-e "s/${LWORD}__ltrim_colon_completions${RWORD}/__minikube_ltrim_colon_completions/g" \
	-e "s/${LWORD}compgen${RWORD}/__minikube_compgen/g" \
	-e "s/${LWORD}compopt${RWORD}/__minikube_compopt/g" \
	-e "s/${LWORD}declare${RWORD}/__minikube_declare/g" \
	-e "s/\\\$(type${RWORD}/\$(__minikube_type/g" \
	-e "s/aliashash\[\"\([a-z]*\)\"\]/aliashash[\1]/g" \
	<<'BASH_COMPLETION_EOF'
# bash completion for minikube                             -*- shell-script -*-

__minikube_debug()
{
    if [[ -n ${BASH_COMP_DEBUG_FILE:-} ]]; then
        echo "$*" >> "${BASH_COMP_DEBUG_FILE}"
    fi
}

# Homebrew on Macs have version 1.3 of bash-completion which doesn't include
# _init_completion. This is a very minimal version of that function.
__minikube_init_completion()
{
    COMPREPLY=()
    _get_comp_words_by_ref "$@" cur prev words cword
}

__minikube_index_of_word()
{
    local w word=$1
    shift
    index=0
    for w in "$@"; do
        [[ $w = "$word" ]] && return
        index=$((index+1))
    done
    index=-1
}

__minikube_contains_word()
{
    local w word=$1; shift
    for w in "$@"; do
        [[ $w = "$word" ]] && return
    done
    return 1
}

__minikube_handle_go_custom_completion()
{
    __minikube_debug "${FUNCNAME[0]}: cur is ${cur}, words[*] is ${words[*]}, #words[@] is ${#words[@]}"

    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16

    local out requestComp lastParam lastChar comp directive args

    # Prepare the command to request completions for the program.
    # Calling ${words[0]} instead of directly minikube allows handling aliases
    args=("${words[@]:1}")
    # Disable ActiveHelp which is not supported for bash completion v1
    requestComp="MINIKUBE_ACTIVE_HELP=0 ${words[0]} __completeNoDesc ${args[*]}"

    lastParam=${words[$((${#words[@]}-1))]}
    lastChar=${lastParam:$((${#lastParam}-1)):1}
    __minikube_debug "${FUNCNAME[0]}: lastParam ${lastParam}, lastChar ${lastChar}"

    if [ -z "${cur}" ] && [ "${lastChar}" != "=" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go method.
        __minikube_debug "${FUNCNAME[0]}: Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __minikube_debug "${FUNCNAME[0]}: calling ${requestComp}"
    # Use eval to handle any environment variables and such
    out=$(eval "${requestComp}" 2>/dev/null)

    # Extract the directive integer at the very end of the output following a colon (:)
    directive=${out##*:}
    # Remove the directive
    out=${out%:*}
    if [ "${directive}" = "${out}" ]; then
        # There is not directive specified
        directive=0
    fi
    __minikube_debug "${FUNCNAME[0]}: the completion directive is: ${directive}"
    __minikube_debug "${FUNCNAME[0]}: the completions are: ${out}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        # Error code.  No completion.
        __minikube_debug "${FUNCNAME[0]}: received error from custom completion go code"
        return
    else
        if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
            if [[ $(type -t compopt) = "builtin" ]]; then
                __minikube_debug "${FUNCNAME[0]}: activating no space"
                compopt -o nospace
            fi
        fi
        if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
            if [[ $(type -t compopt) = "builtin" ]]; then
                __minikube_debug "${FUNCNAME[0]}: activating no file completion"
                compopt +o default
            fi
        fi
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local fullFilter filter filteringCmd
        # Do not use quotes around the $out variable or else newline
        # characters will be kept.
        for filter in ${out}; do
            fullFilter+="$filter|"
        done

        filteringCmd="_filedir $fullFilter"
        __minikube_debug "File filtering command: $filteringCmd"
        $filteringCmd
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        # Use printf to strip any trailing newline
        subdir=$(printf "%s" "${out}")
        if [ -n "$subdir" ]; then
            __minikube_debug "Listing directories in $subdir"
            __minikube_handle_subdirs_in_dir_flag "$subdir"
        else
            __minikube_debug "Listing directories in ."
            _filedir -d
        fi
    else
        while IFS='' read -r comp; do
            COMPREPLY+=("$comp")
        done < <(compgen -W "${out}" -- "$cur")
    fi
}

__minikube_handle_reply()
{
    __minikube_debug "${FUNCNAME[0]}"
    local comp
    case $cur in
        -*)
            if [[ $(type -t compopt) = "builtin" ]]; then
                compopt -o nospace
            fi
            local allflags
            if [ ${#must_have_one_flag[@]} -ne 0 ]; then
                allflags=("${must_have_one_flag[@]}")
            else
                allflags=("${flags[*]} ${two_word_flags[*]}")
            fi
            while IFS='' read -r comp; do
                COMPREPLY+=("$comp")
            done < <(compgen -W "${allflags[*]}" -- "$cur")
            if [[ $(type -t compopt) = "builtin" ]]; then
                [[ "${COMPREPLY[0]}" == *= ]] || compopt +o nospace
            fi

            # complete after --flag=abc
            if [[ $cur == *=* ]]; then
                if [[ $(type -t compopt) = "builtin" ]]; then
                    compopt +o nospace
                fi

                local index flag
                flag="${cur%=*}"
                __minikube_index_of_word "${flag}" "${flags_with_completion[@]}"
                COMPREPLY=()
                if [[ ${index} -ge 0 ]]; then
                    PREFIX=""
                    cur="${cur#*=}"
                    ${flags_completion[${index}]}
                    if [ -n "${ZSH_VERSION:-}" ]; then
                        # zsh completion needs --flag= prefix
                        eval "COMPREPLY=( \"\${COMPREPLY[@]/#/${flag}=}\" )"
                    fi
                fi
            fi

            if [[ -z "${flag_parsing_disabled}" ]]; then
                # If flag parsing is enabled, we have completed the flags and can return.
                # If flag parsing is disabled, we may not know all (or any) of the flags, so we fallthrough
                # to possibly call handle_go_custom_completion.
                return 0;
            fi
            ;;
    esac

    # check if we are handling a flag with special work handling
    local index
    __minikube_index_of_word "${prev}" "${flags_with_completion[@]}"
    if [[ ${index} -ge 0 ]]; then
        ${flags_completion[${index}]}
        return
    fi

    # we are parsing a flag and don't have a special handler, no completion
    if [[ ${cur} != "${words[cword]}" ]]; then
        return
    fi

    local completions
    completions=("${commands[@]}")
    if [[ ${#must_have_one_noun[@]} -ne 0 ]]; then
        completions+=("${must_have_one_noun[@]}")
    elif [[ -n "${has_completion_function}" ]]; then
        # if a go completion function is provided, defer to that function
        __minikube_handle_go_custom_completion
    fi
    if [[ ${#must_have_one_flag[@]} -ne 0 ]]; then
        completions+=("${must_have_one_flag[@]}")
    fi
    while IFS='' read -r comp; do
        COMPREPLY+=("$comp")
    done < <(compgen -W "${completions[*]}" -- "$cur")

    if [[ ${#COMPREPLY[@]} -eq 0 && ${#noun_aliases[@]} -gt 0 && ${#must_have_one_noun[@]} -ne 0 ]]; then
        while IFS='' read -r comp; do
            COMPREPLY+=("$comp")
        done < <(compgen -W "${noun_aliases[*]}" -- "$cur")
    fi

    if [[ ${#COMPREPLY[@]} -eq 0 ]]; then
        if declare -F __minikube_custom_func >/dev/null; then
            # try command name qualified custom func
            __minikube_custom_func
        else
            # otherwise fall back to unqualified for compatibility
            declare -F __custom_func >/dev/null && __custom_func
        fi
    fi

    # available in bash-completion >= 2, not always present on macOS
    if declare -F __ltrim_colon_completions >/dev/null; then
        __ltrim_colon_completions "$cur"
    fi

    # If there is only 1 completion and it is a flag with an = it will be completed
    # but we don't want a space after the =
    if [[ "${#COMPREPLY[@]}" -eq "1" ]] && [[ $(type -t compopt) = "builtin" ]] && [[ "${COMPREPLY[0]}" == --*= ]]; then
       compopt -o nospace
    fi
}

# The arguments should be in the form "ext1|ext2|extn"
__minikube_handle_filename_extension_flag()
{
    local ext="$1"
    _filedir "@(${ext})"
}

__minikube_handle_subdirs_in_dir_flag()
{
    local dir="$1"
    pushd "${dir}" >/dev/null 2>&1 && _filedir -d && popd >/dev/null 2>&1 || return
}

__minikube_handle_flag()
{
    __minikube_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    # if a command required a flag, and we found it, unset must_have_one_flag()
    local flagname=${words[c]}
    local flagvalue=""
    # if the word contained an =
    if [[ ${words[c]} == *"="* ]]; then
        flagvalue=${flagname#*=} # take in as flagvalue after the =
        flagname=${flagname%=*} # strip everything after the =
        flagname="${flagname}=" # but put the = back
    fi
    __minikube_debug "${FUNCNAME[0]}: looking for ${flagname}"
    if __minikube_contains_word "${flagname}" "${must_have_one_flag[@]}"; then
        must_have_one_flag=()
    fi

    # if you set a flag which only applies to this command, don't show subcommands
    if __minikube_contains_word "${flagname}" "${local_nonpersistent_flags[@]}"; then
      commands=()
    fi

    # keep flag value with flagname as flaghash
    # flaghash variable is an associative array which is only supported in bash > 3.
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        if [ -n "${flagvalue}" ] ; then
            flaghash[${flagname}]=${flagvalue}
        elif [ -n "${words[ $((c+1)) ]}" ] ; then
            flaghash[${flagname}]=${words[ $((c+1)) ]}
        else
            flaghash[${flagname}]="true" # pad "true" for bool flag
        fi
    fi

    # skip the argument to a two word flag
    if [[ ${words[c]} != *"="* ]] && __minikube_contains_word "${words[c]}" "${two_word_flags[@]}"; then
        __minikube_debug "${FUNCNAME[0]}: found a flag ${words[c]}, skip the next argument"
        c=$((c+1))
        # if we are looking for a flags value, don't show commands
        if [[ $c -eq $cword ]]; then
            commands=()
        fi
    fi

    c=$((c+1))

}

__minikube_handle_noun()
{
    __minikube_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    if __minikube_contains_word "${words[c]}" "${must_have_one_noun[@]}"; then
        must_have_one_noun=()
    elif __minikube_contains_word "${words[c]}" "${noun_aliases[@]}"; then
        must_have_one_noun=()
    fi

    nouns+=("${words[c]}")
    c=$((c+1))
}

__minikube_handle_command()
{
    __minikube_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    local next_command
    if [[ -n ${last_command} ]]; then
        next_command="_${last_command}_${words[c]//:/__}"
    else
        if [[ $c -eq 0 ]]; then
            next_command="_minikube_root_command"
        else
            next_command="_${words[c]//:/__}"
        fi
    fi
    c=$((c+1))
    __minikube_debug "${FUNCNAME[0]}: looking for ${next_command}"
    declare -F "$next_command" >/dev/null && $next_command
}

__minikube_handle_word()
{
    if [[ $c -ge $cword ]]; then
        __minikube_handle_reply
        return
    fi
    __minikube_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
    if [[ "${words[c]}" == -* ]]; then
        __minikube_handle_flag
    elif __minikube_contains_word "${words[c]}" "${commands[@]}"; then
        __minikube_handle_command
    elif [[ $c -eq 0 ]]; then
        __minikube_handle_command
    elif __minikube_contains_word "${words[c]}" "${command_aliases[@]}"; then
        # aliashash variable is an associative array which is only supported in bash > 3.
        if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
            words[c]=${aliashash[${words[c]}]}
            __minikube_handle_command
        else
            __minikube_handle_noun
        fi
    else
        __minikube_handle_noun
    fi
    __minikube_handle_word
}

_minikube_addons_configure()
{
    last_command="minikube_addons_configure"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons_disable()
{
    last_command="minikube_addons_disable"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons_enable()
{
    last_command="minikube_addons_enable"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--images=")
    two_word_flags+=("--images")
    local_nonpersistent_flags+=("--images")
    local_nonpersistent_flags+=("--images=")
    flags+=("--refresh")
    local_nonpersistent_flags+=("--refresh")
    flags+=("--registries=")
    two_word_flags+=("--registries")
    local_nonpersistent_flags+=("--registries")
    local_nonpersistent_flags+=("--registries=")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons_images()
{
    last_command="minikube_addons_images"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons_list()
{
    last_command="minikube_addons_list"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--docs")
    flags+=("-d")
    local_nonpersistent_flags+=("--docs")
    local_nonpersistent_flags+=("-d")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons_open()
{
    last_command="minikube_addons_open"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    two_word_flags+=("--format")
    flags+=("--https")
    local_nonpersistent_flags+=("--https")
    flags+=("--interval=")
    two_word_flags+=("--interval")
    local_nonpersistent_flags+=("--interval")
    local_nonpersistent_flags+=("--interval=")
    flags+=("--url")
    local_nonpersistent_flags+=("--url")
    flags+=("--wait=")
    two_word_flags+=("--wait")
    local_nonpersistent_flags+=("--wait")
    local_nonpersistent_flags+=("--wait=")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons()
{
    last_command="minikube_addons"

    command_aliases=()

    commands=()
    commands+=("configure")
    commands+=("disable")
    commands+=("enable")
    commands+=("images")
    commands+=("list")
    commands+=("open")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cache_add()
{
    last_command="minikube_cache_add"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cache_delete()
{
    last_command="minikube_cache_delete"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cache_list()
{
    last_command="minikube_cache_list"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    two_word_flags+=("--format")
    local_nonpersistent_flags+=("--format")
    local_nonpersistent_flags+=("--format=")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cache_reload()
{
    last_command="minikube_cache_reload"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cache()
{
    last_command="minikube_cache"

    command_aliases=()

    commands=()
    commands+=("add")
    commands+=("delete")
    commands+=("list")
    commands+=("reload")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_completion_bash()
{
    last_command="minikube_completion_bash"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_completion_fish()
{
    last_command="minikube_completion_fish"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_completion_powershell()
{
    last_command="minikube_completion_powershell"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_completion_zsh()
{
    last_command="minikube_completion_zsh"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_completion()
{
    last_command="minikube_completion"

    command_aliases=()

    commands=()
    commands+=("bash")
    commands+=("fish")
    commands+=("powershell")
    commands+=("zsh")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config_defaults()
{
    last_command="minikube_config_defaults"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config_get()
{
    last_command="minikube_config_get"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config_set()
{
    last_command="minikube_config_set"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config_unset()
{
    last_command="minikube_config_unset"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config_view()
{
    last_command="minikube_config_view"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    two_word_flags+=("--format")
    local_nonpersistent_flags+=("--format")
    local_nonpersistent_flags+=("--format=")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config()
{
    last_command="minikube_config"

    command_aliases=()

    commands=()
    commands+=("defaults")
    commands+=("get")
    commands+=("set")
    commands+=("unset")
    commands+=("view")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cp()
{
    last_command="minikube_cp"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_dashboard()
{
    last_command="minikube_dashboard"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--port=")
    two_word_flags+=("--port")
    local_nonpersistent_flags+=("--port")
    local_nonpersistent_flags+=("--port=")
    flags+=("--url")
    local_nonpersistent_flags+=("--url")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_delete()
{
    last_command="minikube_delete"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--purge")
    local_nonpersistent_flags+=("--purge")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_docker-env()
{
    last_command="minikube_docker-env"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--no-proxy")
    local_nonpersistent_flags+=("--no-proxy")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--shell=")
    two_word_flags+=("--shell")
    local_nonpersistent_flags+=("--shell")
    local_nonpersistent_flags+=("--shell=")
    flags+=("--ssh-add")
    local_nonpersistent_flags+=("--ssh-add")
    flags+=("--ssh-host")
    local_nonpersistent_flags+=("--ssh-host")
    flags+=("--unset")
    flags+=("-u")
    local_nonpersistent_flags+=("--unset")
    local_nonpersistent_flags+=("-u")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_help()
{
    last_command="minikube_help"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    has_completion_function=1
    noun_aliases=()
}

_minikube_image_build()
{
    last_command="minikube_image_build"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--build-env=")
    two_word_flags+=("--build-env")
    local_nonpersistent_flags+=("--build-env")
    local_nonpersistent_flags+=("--build-env=")
    flags+=("--build-opt=")
    two_word_flags+=("--build-opt")
    local_nonpersistent_flags+=("--build-opt")
    local_nonpersistent_flags+=("--build-opt=")
    flags+=("--file=")
    two_word_flags+=("--file")
    two_word_flags+=("-f")
    local_nonpersistent_flags+=("--file")
    local_nonpersistent_flags+=("--file=")
    local_nonpersistent_flags+=("-f")
    flags+=("--node=")
    two_word_flags+=("--node")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--node")
    local_nonpersistent_flags+=("--node=")
    local_nonpersistent_flags+=("-n")
    flags+=("--push")
    local_nonpersistent_flags+=("--push")
    flags+=("--tag=")
    two_word_flags+=("--tag")
    two_word_flags+=("-t")
    local_nonpersistent_flags+=("--tag")
    local_nonpersistent_flags+=("--tag=")
    local_nonpersistent_flags+=("-t")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_image_load()
{
    last_command="minikube_image_load"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--daemon")
    local_nonpersistent_flags+=("--daemon")
    flags+=("--overwrite")
    local_nonpersistent_flags+=("--overwrite")
    flags+=("--pull")
    local_nonpersistent_flags+=("--pull")
    flags+=("--remote")
    local_nonpersistent_flags+=("--remote")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_image_ls()
{
    last_command="minikube_image_ls"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    two_word_flags+=("--format")
    local_nonpersistent_flags+=("--format")
    local_nonpersistent_flags+=("--format=")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_image_pull()
{
    last_command="minikube_image_pull"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_image_push()
{
    last_command="minikube_image_push"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_image_rm()
{
    last_command="minikube_image_rm"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_image_save()
{
    last_command="minikube_image_save"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--daemon")
    local_nonpersistent_flags+=("--daemon")
    flags+=("--remote")
    local_nonpersistent_flags+=("--remote")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_image_tag()
{
    last_command="minikube_image_tag"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_image()
{
    last_command="minikube_image"

    command_aliases=()

    commands=()
    commands+=("build")
    commands+=("load")
    commands+=("ls")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("list")
        aliashash["list"]="ls"
    fi
    commands+=("pull")
    commands+=("push")
    commands+=("rm")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("remove")
        aliashash["remove"]="rm"
        command_aliases+=("unload")
        aliashash["unload"]="rm"
    fi
    commands+=("save")
    commands+=("tag")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("list")
        aliashash["list"]="tag"
    fi

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_ip()
{
    last_command="minikube_ip"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--node=")
    two_word_flags+=("--node")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--node")
    local_nonpersistent_flags+=("--node=")
    local_nonpersistent_flags+=("-n")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_kubectl()
{
    last_command="minikube_kubectl"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--ssh")
    local_nonpersistent_flags+=("--ssh")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_license()
{
    last_command="minikube_license"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dir=")
    two_word_flags+=("--dir")
    two_word_flags+=("-d")
    local_nonpersistent_flags+=("--dir")
    local_nonpersistent_flags+=("--dir=")
    local_nonpersistent_flags+=("-d")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_logs()
{
    last_command="minikube_logs"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--audit")
    local_nonpersistent_flags+=("--audit")
    flags+=("--file=")
    two_word_flags+=("--file")
    local_nonpersistent_flags+=("--file")
    local_nonpersistent_flags+=("--file=")
    flags+=("--follow")
    flags+=("-f")
    local_nonpersistent_flags+=("--follow")
    local_nonpersistent_flags+=("-f")
    flags+=("--last-start-only")
    local_nonpersistent_flags+=("--last-start-only")
    flags+=("--length=")
    two_word_flags+=("--length")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--length")
    local_nonpersistent_flags+=("--length=")
    local_nonpersistent_flags+=("-n")
    flags+=("--node=")
    two_word_flags+=("--node")
    local_nonpersistent_flags+=("--node")
    local_nonpersistent_flags+=("--node=")
    flags+=("--problems")
    local_nonpersistent_flags+=("--problems")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_mount()
{
    last_command="minikube_mount"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--9p-version=")
    two_word_flags+=("--9p-version")
    local_nonpersistent_flags+=("--9p-version")
    local_nonpersistent_flags+=("--9p-version=")
    flags+=("--gid=")
    two_word_flags+=("--gid")
    local_nonpersistent_flags+=("--gid")
    local_nonpersistent_flags+=("--gid=")
    flags+=("--ip=")
    two_word_flags+=("--ip")
    local_nonpersistent_flags+=("--ip")
    local_nonpersistent_flags+=("--ip=")
    flags+=("--kill")
    local_nonpersistent_flags+=("--kill")
    flags+=("--msize=")
    two_word_flags+=("--msize")
    local_nonpersistent_flags+=("--msize")
    local_nonpersistent_flags+=("--msize=")
    flags+=("--options=")
    two_word_flags+=("--options")
    local_nonpersistent_flags+=("--options")
    local_nonpersistent_flags+=("--options=")
    flags+=("--port=")
    two_word_flags+=("--port")
    local_nonpersistent_flags+=("--port")
    local_nonpersistent_flags+=("--port=")
    flags+=("--type=")
    two_word_flags+=("--type")
    local_nonpersistent_flags+=("--type")
    local_nonpersistent_flags+=("--type=")
    flags+=("--uid=")
    two_word_flags+=("--uid")
    local_nonpersistent_flags+=("--uid")
    local_nonpersistent_flags+=("--uid=")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_node_add()
{
    last_command="minikube_node_add"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--control-plane")
    local_nonpersistent_flags+=("--control-plane")
    flags+=("--delete-on-failure")
    local_nonpersistent_flags+=("--delete-on-failure")
    flags+=("--worker")
    local_nonpersistent_flags+=("--worker")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_node_delete()
{
    last_command="minikube_node_delete"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_node_list()
{
    last_command="minikube_node_list"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_node_start()
{
    last_command="minikube_node_start"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--delete-on-failure")
    local_nonpersistent_flags+=("--delete-on-failure")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_node_stop()
{
    last_command="minikube_node_stop"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_node()
{
    last_command="minikube_node"

    command_aliases=()

    commands=()
    commands+=("add")
    commands+=("delete")
    commands+=("list")
    commands+=("start")
    commands+=("stop")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_options()
{
    last_command="minikube_options"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_pause()
{
    last_command="minikube_pause"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all-namespaces")
    flags+=("-A")
    local_nonpersistent_flags+=("--all-namespaces")
    local_nonpersistent_flags+=("-A")
    flags+=("--namespaces=")
    two_word_flags+=("--namespaces")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespaces")
    local_nonpersistent_flags+=("--namespaces=")
    local_nonpersistent_flags+=("-n")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_podman-env()
{
    last_command="minikube_podman-env"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--shell=")
    two_word_flags+=("--shell")
    local_nonpersistent_flags+=("--shell")
    local_nonpersistent_flags+=("--shell=")
    flags+=("--unset")
    flags+=("-u")
    local_nonpersistent_flags+=("--unset")
    local_nonpersistent_flags+=("-u")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_profile_list()
{
    last_command="minikube_profile_list"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--light")
    flags+=("-l")
    local_nonpersistent_flags+=("--light")
    local_nonpersistent_flags+=("-l")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_profile()
{
    last_command="minikube_profile"

    command_aliases=()

    commands=()
    commands+=("list")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_service_list()
{
    last_command="minikube_service_list"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--format=")
    two_word_flags+=("--format")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_service()
{
    last_command="minikube_service"

    command_aliases=()

    commands=()
    commands+=("list")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--format=")
    two_word_flags+=("--format")
    flags+=("--https")
    local_nonpersistent_flags+=("--https")
    flags+=("--interval=")
    two_word_flags+=("--interval")
    local_nonpersistent_flags+=("--interval")
    local_nonpersistent_flags+=("--interval=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    local_nonpersistent_flags+=("-n")
    flags+=("--url")
    local_nonpersistent_flags+=("--url")
    flags+=("--wait=")
    two_word_flags+=("--wait")
    local_nonpersistent_flags+=("--wait")
    local_nonpersistent_flags+=("--wait=")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_ssh()
{
    last_command="minikube_ssh"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--native-ssh")
    local_nonpersistent_flags+=("--native-ssh")
    flags+=("--node=")
    two_word_flags+=("--node")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--node")
    local_nonpersistent_flags+=("--node=")
    local_nonpersistent_flags+=("-n")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_ssh-host()
{
    last_command="minikube_ssh-host"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--append-known")
    local_nonpersistent_flags+=("--append-known")
    flags+=("--node=")
    two_word_flags+=("--node")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--node")
    local_nonpersistent_flags+=("--node=")
    local_nonpersistent_flags+=("-n")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_ssh-key()
{
    last_command="minikube_ssh-key"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--node=")
    two_word_flags+=("--node")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--node")
    local_nonpersistent_flags+=("--node=")
    local_nonpersistent_flags+=("-n")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_start()
{
    last_command="minikube_start"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--addons=")
    two_word_flags+=("--addons")
    local_nonpersistent_flags+=("--addons")
    local_nonpersistent_flags+=("--addons=")
    flags+=("--apiserver-ips=")
    two_word_flags+=("--apiserver-ips")
    local_nonpersistent_flags+=("--apiserver-ips")
    local_nonpersistent_flags+=("--apiserver-ips=")
    flags+=("--apiserver-name=")
    two_word_flags+=("--apiserver-name")
    local_nonpersistent_flags+=("--apiserver-name")
    local_nonpersistent_flags+=("--apiserver-name=")
    flags+=("--apiserver-names=")
    two_word_flags+=("--apiserver-names")
    local_nonpersistent_flags+=("--apiserver-names")
    local_nonpersistent_flags+=("--apiserver-names=")
    flags+=("--apiserver-port=")
    two_word_flags+=("--apiserver-port")
    local_nonpersistent_flags+=("--apiserver-port")
    local_nonpersistent_flags+=("--apiserver-port=")
    flags+=("--auto-pause-interval=")
    two_word_flags+=("--auto-pause-interval")
    local_nonpersistent_flags+=("--auto-pause-interval")
    local_nonpersistent_flags+=("--auto-pause-interval=")
    flags+=("--auto-update-drivers")
    local_nonpersistent_flags+=("--auto-update-drivers")
    flags+=("--base-image=")
    two_word_flags+=("--base-image")
    local_nonpersistent_flags+=("--base-image")
    local_nonpersistent_flags+=("--base-image=")
    flags+=("--binary-mirror=")
    two_word_flags+=("--binary-mirror")
    local_nonpersistent_flags+=("--binary-mirror")
    local_nonpersistent_flags+=("--binary-mirror=")
    flags+=("--cache-images")
    local_nonpersistent_flags+=("--cache-images")
    flags+=("--cert-expiration=")
    two_word_flags+=("--cert-expiration")
    local_nonpersistent_flags+=("--cert-expiration")
    local_nonpersistent_flags+=("--cert-expiration=")
    flags+=("--cni=")
    two_word_flags+=("--cni")
    local_nonpersistent_flags+=("--cni")
    local_nonpersistent_flags+=("--cni=")
    flags+=("--container-runtime=")
    two_word_flags+=("--container-runtime")
    local_nonpersistent_flags+=("--container-runtime")
    local_nonpersistent_flags+=("--container-runtime=")
    flags+=("--cpus=")
    two_word_flags+=("--cpus")
    local_nonpersistent_flags+=("--cpus")
    local_nonpersistent_flags+=("--cpus=")
    flags+=("--cri-socket=")
    two_word_flags+=("--cri-socket")
    local_nonpersistent_flags+=("--cri-socket")
    local_nonpersistent_flags+=("--cri-socket=")
    flags+=("--delete-on-failure")
    local_nonpersistent_flags+=("--delete-on-failure")
    flags+=("--disable-driver-mounts")
    local_nonpersistent_flags+=("--disable-driver-mounts")
    flags+=("--disable-metrics")
    local_nonpersistent_flags+=("--disable-metrics")
    flags+=("--disable-optimizations")
    local_nonpersistent_flags+=("--disable-optimizations")
    flags+=("--disk-size=")
    two_word_flags+=("--disk-size")
    local_nonpersistent_flags+=("--disk-size")
    local_nonpersistent_flags+=("--disk-size=")
    flags+=("--dns-domain=")
    two_word_flags+=("--dns-domain")
    local_nonpersistent_flags+=("--dns-domain")
    local_nonpersistent_flags+=("--dns-domain=")
    flags+=("--dns-proxy")
    local_nonpersistent_flags+=("--dns-proxy")
    flags+=("--docker-env=")
    two_word_flags+=("--docker-env")
    local_nonpersistent_flags+=("--docker-env")
    local_nonpersistent_flags+=("--docker-env=")
    flags+=("--docker-opt=")
    two_word_flags+=("--docker-opt")
    local_nonpersistent_flags+=("--docker-opt")
    local_nonpersistent_flags+=("--docker-opt=")
    flags+=("--download-only")
    local_nonpersistent_flags+=("--download-only")
    flags+=("--driver=")
    two_word_flags+=("--driver")
    local_nonpersistent_flags+=("--driver")
    local_nonpersistent_flags+=("--driver=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--embed-certs")
    local_nonpersistent_flags+=("--embed-certs")
    flags+=("--enable-default-cni")
    local_nonpersistent_flags+=("--enable-default-cni")
    flags+=("--extra-config=")
    two_word_flags+=("--extra-config")
    local_nonpersistent_flags+=("--extra-config")
    local_nonpersistent_flags+=("--extra-config=")
    flags+=("--extra-disks=")
    two_word_flags+=("--extra-disks")
    local_nonpersistent_flags+=("--extra-disks")
    local_nonpersistent_flags+=("--extra-disks=")
    flags+=("--feature-gates=")
    two_word_flags+=("--feature-gates")
    local_nonpersistent_flags+=("--feature-gates")
    local_nonpersistent_flags+=("--feature-gates=")
    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--force-systemd")
    local_nonpersistent_flags+=("--force-systemd")
    flags+=("--gpus=")
    two_word_flags+=("--gpus")
    two_word_flags+=("-g")
    local_nonpersistent_flags+=("--gpus")
    local_nonpersistent_flags+=("--gpus=")
    local_nonpersistent_flags+=("-g")
    flags+=("--ha")
    local_nonpersistent_flags+=("--ha")
    flags+=("--host-dns-resolver")
    local_nonpersistent_flags+=("--host-dns-resolver")
    flags+=("--host-only-cidr=")
    two_word_flags+=("--host-only-cidr")
    local_nonpersistent_flags+=("--host-only-cidr")
    local_nonpersistent_flags+=("--host-only-cidr=")
    flags+=("--host-only-nic-type=")
    two_word_flags+=("--host-only-nic-type")
    local_nonpersistent_flags+=("--host-only-nic-type")
    local_nonpersistent_flags+=("--host-only-nic-type=")
    flags+=("--hyperkit-vpnkit-sock=")
    two_word_flags+=("--hyperkit-vpnkit-sock")
    local_nonpersistent_flags+=("--hyperkit-vpnkit-sock")
    local_nonpersistent_flags+=("--hyperkit-vpnkit-sock=")
    flags+=("--hyperkit-vsock-ports=")
    two_word_flags+=("--hyperkit-vsock-ports")
    local_nonpersistent_flags+=("--hyperkit-vsock-ports")
    local_nonpersistent_flags+=("--hyperkit-vsock-ports=")
    flags+=("--hyperv-external-adapter=")
    two_word_flags+=("--hyperv-external-adapter")
    local_nonpersistent_flags+=("--hyperv-external-adapter")
    local_nonpersistent_flags+=("--hyperv-external-adapter=")
    flags+=("--hyperv-use-external-switch")
    local_nonpersistent_flags+=("--hyperv-use-external-switch")
    flags+=("--hyperv-virtual-switch=")
    two_word_flags+=("--hyperv-virtual-switch")
    local_nonpersistent_flags+=("--hyperv-virtual-switch")
    local_nonpersistent_flags+=("--hyperv-virtual-switch=")
    flags+=("--image-mirror-country=")
    two_word_flags+=("--image-mirror-country")
    local_nonpersistent_flags+=("--image-mirror-country")
    local_nonpersistent_flags+=("--image-mirror-country=")
    flags+=("--image-repository=")
    two_word_flags+=("--image-repository")
    local_nonpersistent_flags+=("--image-repository")
    local_nonpersistent_flags+=("--image-repository=")
    flags+=("--insecure-registry=")
    two_word_flags+=("--insecure-registry")
    local_nonpersistent_flags+=("--insecure-registry")
    local_nonpersistent_flags+=("--insecure-registry=")
    flags+=("--install-addons")
    local_nonpersistent_flags+=("--install-addons")
    flags+=("--interactive")
    local_nonpersistent_flags+=("--interactive")
    flags+=("--iso-url=")
    two_word_flags+=("--iso-url")
    local_nonpersistent_flags+=("--iso-url")
    local_nonpersistent_flags+=("--iso-url=")
    flags+=("--keep-context")
    local_nonpersistent_flags+=("--keep-context")
    flags+=("--kubernetes-version=")
    two_word_flags+=("--kubernetes-version")
    local_nonpersistent_flags+=("--kubernetes-version")
    local_nonpersistent_flags+=("--kubernetes-version=")
    flags+=("--kvm-gpu")
    local_nonpersistent_flags+=("--kvm-gpu")
    flags+=("--kvm-hidden")
    local_nonpersistent_flags+=("--kvm-hidden")
    flags+=("--kvm-network=")
    two_word_flags+=("--kvm-network")
    local_nonpersistent_flags+=("--kvm-network")
    local_nonpersistent_flags+=("--kvm-network=")
    flags+=("--kvm-numa-count=")
    two_word_flags+=("--kvm-numa-count")
    local_nonpersistent_flags+=("--kvm-numa-count")
    local_nonpersistent_flags+=("--kvm-numa-count=")
    flags+=("--kvm-qemu-uri=")
    two_word_flags+=("--kvm-qemu-uri")
    local_nonpersistent_flags+=("--kvm-qemu-uri")
    local_nonpersistent_flags+=("--kvm-qemu-uri=")
    flags+=("--listen-address=")
    two_word_flags+=("--listen-address")
    local_nonpersistent_flags+=("--listen-address")
    local_nonpersistent_flags+=("--listen-address=")
    flags+=("--memory=")
    two_word_flags+=("--memory")
    local_nonpersistent_flags+=("--memory")
    local_nonpersistent_flags+=("--memory=")
    flags+=("--mount")
    local_nonpersistent_flags+=("--mount")
    flags+=("--mount-9p-version=")
    two_word_flags+=("--mount-9p-version")
    local_nonpersistent_flags+=("--mount-9p-version")
    local_nonpersistent_flags+=("--mount-9p-version=")
    flags+=("--mount-gid=")
    two_word_flags+=("--mount-gid")
    local_nonpersistent_flags+=("--mount-gid")
    local_nonpersistent_flags+=("--mount-gid=")
    flags+=("--mount-ip=")
    two_word_flags+=("--mount-ip")
    local_nonpersistent_flags+=("--mount-ip")
    local_nonpersistent_flags+=("--mount-ip=")
    flags+=("--mount-msize=")
    two_word_flags+=("--mount-msize")
    local_nonpersistent_flags+=("--mount-msize")
    local_nonpersistent_flags+=("--mount-msize=")
    flags+=("--mount-options=")
    two_word_flags+=("--mount-options")
    local_nonpersistent_flags+=("--mount-options")
    local_nonpersistent_flags+=("--mount-options=")
    flags+=("--mount-port=")
    two_word_flags+=("--mount-port")
    local_nonpersistent_flags+=("--mount-port")
    local_nonpersistent_flags+=("--mount-port=")
    flags+=("--mount-string=")
    two_word_flags+=("--mount-string")
    local_nonpersistent_flags+=("--mount-string")
    local_nonpersistent_flags+=("--mount-string=")
    flags+=("--mount-type=")
    two_word_flags+=("--mount-type")
    local_nonpersistent_flags+=("--mount-type")
    local_nonpersistent_flags+=("--mount-type=")
    flags+=("--mount-uid=")
    two_word_flags+=("--mount-uid")
    local_nonpersistent_flags+=("--mount-uid")
    local_nonpersistent_flags+=("--mount-uid=")
    flags+=("--namespace=")
    two_word_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--nat-nic-type=")
    two_word_flags+=("--nat-nic-type")
    local_nonpersistent_flags+=("--nat-nic-type")
    local_nonpersistent_flags+=("--nat-nic-type=")
    flags+=("--native-ssh")
    local_nonpersistent_flags+=("--native-ssh")
    flags+=("--network=")
    two_word_flags+=("--network")
    local_nonpersistent_flags+=("--network")
    local_nonpersistent_flags+=("--network=")
    flags+=("--network-plugin=")
    two_word_flags+=("--network-plugin")
    local_nonpersistent_flags+=("--network-plugin")
    local_nonpersistent_flags+=("--network-plugin=")
    flags+=("--nfs-share=")
    two_word_flags+=("--nfs-share")
    local_nonpersistent_flags+=("--nfs-share")
    local_nonpersistent_flags+=("--nfs-share=")
    flags+=("--nfs-shares-root=")
    two_word_flags+=("--nfs-shares-root")
    local_nonpersistent_flags+=("--nfs-shares-root")
    local_nonpersistent_flags+=("--nfs-shares-root=")
    flags+=("--no-kubernetes")
    local_nonpersistent_flags+=("--no-kubernetes")
    flags+=("--no-vtx-check")
    local_nonpersistent_flags+=("--no-vtx-check")
    flags+=("--nodes=")
    two_word_flags+=("--nodes")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--nodes")
    local_nonpersistent_flags+=("--nodes=")
    local_nonpersistent_flags+=("-n")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--ports=")
    two_word_flags+=("--ports")
    local_nonpersistent_flags+=("--ports")
    local_nonpersistent_flags+=("--ports=")
    flags+=("--preload")
    local_nonpersistent_flags+=("--preload")
    flags+=("--qemu-firmware-path=")
    two_word_flags+=("--qemu-firmware-path")
    local_nonpersistent_flags+=("--qemu-firmware-path")
    local_nonpersistent_flags+=("--qemu-firmware-path=")
    flags+=("--registry-mirror=")
    two_word_flags+=("--registry-mirror")
    local_nonpersistent_flags+=("--registry-mirror")
    local_nonpersistent_flags+=("--registry-mirror=")
    flags+=("--service-cluster-ip-range=")
    two_word_flags+=("--service-cluster-ip-range")
    local_nonpersistent_flags+=("--service-cluster-ip-range")
    local_nonpersistent_flags+=("--service-cluster-ip-range=")
    flags+=("--socket-vmnet-client-path=")
    two_word_flags+=("--socket-vmnet-client-path")
    local_nonpersistent_flags+=("--socket-vmnet-client-path")
    local_nonpersistent_flags+=("--socket-vmnet-client-path=")
    flags+=("--socket-vmnet-path=")
    two_word_flags+=("--socket-vmnet-path")
    local_nonpersistent_flags+=("--socket-vmnet-path")
    local_nonpersistent_flags+=("--socket-vmnet-path=")
    flags+=("--ssh-ip-address=")
    two_word_flags+=("--ssh-ip-address")
    local_nonpersistent_flags+=("--ssh-ip-address")
    local_nonpersistent_flags+=("--ssh-ip-address=")
    flags+=("--ssh-key=")
    two_word_flags+=("--ssh-key")
    local_nonpersistent_flags+=("--ssh-key")
    local_nonpersistent_flags+=("--ssh-key=")
    flags+=("--ssh-port=")
    two_word_flags+=("--ssh-port")
    local_nonpersistent_flags+=("--ssh-port")
    local_nonpersistent_flags+=("--ssh-port=")
    flags+=("--ssh-user=")
    two_word_flags+=("--ssh-user")
    local_nonpersistent_flags+=("--ssh-user")
    local_nonpersistent_flags+=("--ssh-user=")
    flags+=("--static-ip=")
    two_word_flags+=("--static-ip")
    local_nonpersistent_flags+=("--static-ip")
    local_nonpersistent_flags+=("--static-ip=")
    flags+=("--subnet=")
    two_word_flags+=("--subnet")
    local_nonpersistent_flags+=("--subnet")
    local_nonpersistent_flags+=("--subnet=")
    flags+=("--trace=")
    two_word_flags+=("--trace")
    local_nonpersistent_flags+=("--trace")
    local_nonpersistent_flags+=("--trace=")
    flags+=("--uuid=")
    two_word_flags+=("--uuid")
    local_nonpersistent_flags+=("--uuid")
    local_nonpersistent_flags+=("--uuid=")
    flags+=("--vm")
    local_nonpersistent_flags+=("--vm")
    flags+=("--vm-driver=")
    two_word_flags+=("--vm-driver")
    local_nonpersistent_flags+=("--vm-driver")
    local_nonpersistent_flags+=("--vm-driver=")
    flags+=("--wait=")
    two_word_flags+=("--wait")
    local_nonpersistent_flags+=("--wait")
    local_nonpersistent_flags+=("--wait=")
    flags+=("--wait-timeout=")
    two_word_flags+=("--wait-timeout")
    local_nonpersistent_flags+=("--wait-timeout")
    local_nonpersistent_flags+=("--wait-timeout=")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_status()
{
    last_command="minikube_status"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    two_word_flags+=("--format")
    two_word_flags+=("-f")
    local_nonpersistent_flags+=("--format")
    local_nonpersistent_flags+=("--format=")
    local_nonpersistent_flags+=("-f")
    flags+=("--layout=")
    two_word_flags+=("--layout")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--layout")
    local_nonpersistent_flags+=("--layout=")
    local_nonpersistent_flags+=("-l")
    flags+=("--node=")
    two_word_flags+=("--node")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--node")
    local_nonpersistent_flags+=("--node=")
    local_nonpersistent_flags+=("-n")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--watch")
    flags+=("-w")
    local_nonpersistent_flags+=("--watch")
    local_nonpersistent_flags+=("-w")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_stop()
{
    last_command="minikube_stop"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--cancel-scheduled")
    local_nonpersistent_flags+=("--cancel-scheduled")
    flags+=("--keep-context-active")
    local_nonpersistent_flags+=("--keep-context-active")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--schedule=")
    two_word_flags+=("--schedule")
    local_nonpersistent_flags+=("--schedule")
    local_nonpersistent_flags+=("--schedule=")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_tunnel()
{
    last_command="minikube_tunnel"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--bind-address=")
    two_word_flags+=("--bind-address")
    local_nonpersistent_flags+=("--bind-address")
    local_nonpersistent_flags+=("--bind-address=")
    flags+=("--cleanup")
    flags+=("-c")
    local_nonpersistent_flags+=("--cleanup")
    local_nonpersistent_flags+=("-c")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_unpause()
{
    last_command="minikube_unpause"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all-namespaces")
    flags+=("-A")
    local_nonpersistent_flags+=("--all-namespaces")
    local_nonpersistent_flags+=("-A")
    flags+=("--namespaces=")
    two_word_flags+=("--namespaces")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespaces")
    local_nonpersistent_flags+=("--namespaces=")
    local_nonpersistent_flags+=("-n")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_update-check()
{
    last_command="minikube_update-check"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_update-context()
{
    last_command="minikube_update-context"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_version()
{
    last_command="minikube_version"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--components")
    local_nonpersistent_flags+=("--components")
    flags+=("--output=")
    two_word_flags+=("--output")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output")
    local_nonpersistent_flags+=("--output=")
    local_nonpersistent_flags+=("-o")
    flags+=("--short")
    local_nonpersistent_flags+=("--short")
    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_root_command()
{
    last_command="minikube"

    command_aliases=()

    commands=()
    commands+=("addons")
    commands+=("cache")
    commands+=("completion")
    commands+=("config")
    commands+=("cp")
    commands+=("dashboard")
    commands+=("delete")
    commands+=("docker-env")
    commands+=("help")
    commands+=("image")
    commands+=("ip")
    commands+=("kubectl")
    commands+=("license")
    commands+=("logs")
    commands+=("mount")
    commands+=("node")
    commands+=("options")
    commands+=("pause")
    commands+=("podman-env")
    commands+=("profile")
    commands+=("service")
    commands+=("ssh")
    commands+=("ssh-host")
    commands+=("ssh-key")
    commands+=("start")
    commands+=("status")
    commands+=("stop")
    commands+=("tunnel")
    commands+=("unpause")
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        command_aliases+=("resume")
        aliashash["resume"]="unpause"
    fi
    commands+=("update-check")
    commands+=("update-context")
    commands+=("version")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--add_dir_header")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("--bootstrapper")
    two_word_flags+=("-b")
    flags+=("--help")
    flags+=("-h")
    flags+=("--log_backtrace_at=")
    two_word_flags+=("--log_backtrace_at")
    flags+=("--log_dir=")
    two_word_flags+=("--log_dir")
    flags+=("--log_file=")
    two_word_flags+=("--log_file")
    flags+=("--log_file_max_size=")
    two_word_flags+=("--log_file_max_size")
    flags+=("--logtostderr")
    flags+=("--one_output")
    flags+=("--profile=")
    two_word_flags+=("--profile")
    two_word_flags+=("-p")
    flags+=("--rootless")
    flags+=("--skip-audit")
    flags+=("--skip_headers")
    flags+=("--skip_log_headers")
    flags+=("--stderrthreshold=")
    two_word_flags+=("--stderrthreshold")
    flags+=("--user=")
    two_word_flags+=("--user")
    flags+=("--v=")
    two_word_flags+=("--v")
    two_word_flags+=("-v")
    flags+=("--vmodule=")
    two_word_flags+=("--vmodule")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

__start_minikube()
{
    local cur prev words cword split
    declare -A flaghash 2>/dev/null || :
    declare -A aliashash 2>/dev/null || :
    if declare -F _init_completion >/dev/null 2>&1; then
        _init_completion -s || return
    else
        __minikube_init_completion -n "=" || return
    fi

    local c=0
    local flag_parsing_disabled=
    local flags=()
    local two_word_flags=()
    local local_nonpersistent_flags=()
    local flags_with_completion=()
    local flags_completion=()
    local commands=("minikube")
    local command_aliases=()
    local must_have_one_flag=()
    local must_have_one_noun=()
    local has_completion_function=""
    local last_command=""
    local nouns=()
    local noun_aliases=()

    __minikube_handle_word
}

if [[ $(type -t compopt) = "builtin" ]]; then
    complete -o default -F __start_minikube minikube
else
    complete -o default -o nospace -F __start_minikube minikube
fi

# ex: ts=4 sw=4 et filetype=sh

BASH_COMPLETION_EOF
}
__minikube_bash_source <(__minikube_convert_bash_to_zsh)

# Load pyenv automatically by appending
# the following to
# ~/.zprofile (for login shells)
# and ~/.zshrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
