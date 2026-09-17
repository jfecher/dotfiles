# Path to your oh-my-zsh installation.
export ZSH=/Users/jakefecher/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunaku"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
alias nargo=~/Code/Noir/noir/target/debug/nargo

export PATH=~/.local/bin:~/Code/Ante/ante/target/release:$PATH

export WINEPREFIX='~/.wine'
export WINEARCH='win64'

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export JDK_HOME='/usr/lib/jvm/java-8-openjdk'
export _JAVA_AWT_WM_NONREPARENTING=1

export VISUAL='nvim'
export EDITOR='nvim'
source $ZSH/oh-my-zsh.sh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# [ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

# . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export CC=/opt/homebrew/opt/llvm/bin/clang
export CXX=/opt/homebrew/opt/llvm/bin/clang++

export Z3_SYS_Z3_HEADER=/opt/homebrew/include/z3.h

export LLVM_SYS_120_PREFIX=/Users/jakefecher/.config/llvmenv/12.0.1
export LLVM_SYS_130_PREFIX=/Users/jakefecher/.config/llvmenv/13.0.0
export LLVM_SYS_160_PREFIX=/opt/homebrew/opt/llvm@16
export LLVM_SYS_170_PREFIX=/opt/homebrew/opt/llvm@17
export LLVM_SYS_180_PREFIX=/opt/homebrew/opt/llvm@18
export LLVM_SYS_211_PREFIX=/opt/homebrew/opt/llvm

export RUST_BACKTRACE=0

alias randomize_background='swaybg -i ~/Pictures/`ls ~/Pictures/ | shuf | head -1`'
alias randomize_theme='I=`ls ~/Pictures | shuf | head -1`; wal -i ~/Pictures/$I; swaybg -i ~/Pictures/$I'

alias install='brew install'
alias uninstall='brew uninstall'
alias update='brew update'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gch='git checkout'
alias gchm='git checkout master'
alias gpul='git pull'
alias gpoh='git push origin HEAD'
alias gq='git add . && git commit -m "quick fix" && git push'

alias cb='cargo build'
alias ct='cargo test'
alias ctn='cargo test -- --nocapture'
alias cf='cargo fmt'
alias clip='cargo clippy --all-targets --workspace'
alias cfclip='cargo fmt && cargo clippy'
alias cre='cargo run execute'
alias sre='cd ~/Code/Noir/noir/short && cargo run execute'

alias ls='ls --color=yes'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias vn='cd ~/Code/Noir/noir; nvim'

c() {
    cd $1
    ls
}

alias cpf='cp -avr'
alias uniso='7z x'

alias v='nvim'
alias cv='git diff --name-only | uniq | xargs nvim'

alias vima='cd ~/Code/Ante/ante && nvim'
alias gt='goldentests'

alias hugo='~/Programs/hugo/hugo'

# export LLVM_SYS_100_PREFIX=$(llvmenv prefix)

alias ping='ping -c 1 www.google.com'

# color theme
#if [ "$TERM" = "linux" ]; then
#    echo -en "\e]P0000000" #black
#    echo -en "\e]P8555555" #darkgrey
#    echo -en "\e]P9F92672" #darkred
#    echo -en "\e]P1F92672" #red
#    echo -en "\e]PAA6E22E" #darkgreen
#    echo -en "\e]P2A6E22E" #green
#    echo -en "\e]PBE6DB74" #brown
#    echo -en "\e]P3E6DB74" #yellow
#    echo -en "\e]PC66D9EF" #darkblue
#    echo -en "\e]P466D9EF" #blue
#    echo -en "\e]PDAE81FF" #purple
#    echo -en "\e]P5AE81FF" #purple
#    echo -en "\e]PE66D9EF" #darkcyan
#    
#    echo -en "\e]P666D9EF" #cyan
#    
#    echo -en "\e]P7FFFFFF" #white
#    echo -en "\e]PFFFFFFF" #darkgrey
#fi

source /Users/jakefecher/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f "/Users/jakefecher/.ghcup/env" ] && source "/Users/jakefecher/.ghcup/env" # ghcup-env

eval "$(direnv hook zsh)"

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

export NARGO_HOME="/Users/jakefecher/.nargo"

export PATH="$PATH:$NARGO_HOME/bin"
