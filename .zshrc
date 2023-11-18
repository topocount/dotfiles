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
alias pn=pnpm

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
