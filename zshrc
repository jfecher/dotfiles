# Path to your oh-my-zsh installation.
export ZSH=/home/rndmprsn/.oh-my-zsh

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
plugins=(git fast-syntax-highlighting)

# User configuration
# alias time=hyperfine
alias storage=dust

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/rndmprsn/Code/Ante/pygments:/home/rndmprsn/.cargo/bin:/home/rndmprsn/.ghcup/bin"
# export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export WINEPREFIX='/home/rndmprsn/.wine'
export WINEARCH='win64'

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export JDK_HOME='/usr/lib/jvm/java-8-openjdk'
export _JAVA_AWT_WM_NONREPARENTING=1

export VISUAL='nvim'
export EDITOR='nvim'
source $ZSH/oh-my-zsh.sh

source ~/.config/nvim/bundle/gruvbox/gruvbox_256palette.sh

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

# . /home/rndmprsn/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export CC='gcc'
export CXX='g++'

export RUST_BACKTRACE=0

export STEAM_FRAME_FORCE_CLOSE=1
alias divinity='pushd; cd /home/rndmprsn/.local/share/Steam/steamapps/common/Divinity\ Original\ Sin\ Enhanced\ Edition && optirun ./EoCApp; xrandr --size 3840x2160; popd'

alias randomize_background='swaybg -i /home/rndmprsn/Pictures/`ls /home/rndmprsn/Pictures/ | shuf | head -1`'
alias randomize_theme='I=`ls /home/rndmprsn/Pictures | shuf | head -1`; wal -i /home/rndmprsn/Pictures/$I; swaybg -i /home/rndmprsn/Pictures/$I'

alias install='sudo pacman -Sy'
alias uninstall='sudo pacman -Rsn'
alias uninstall-orphans='sudo pacman -Rsn $(pacman -Qdtq)'
alias update='sudo pacman -Syuu'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gpoh='git push origin HEAD'
alias gq='git add . && git commit -m "quick fix" && git push'

alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias nuwave='/home/rndmprsn/Code/Ante/wifi/nuwave &'

c() {
    cd $1
    ls
}

usb() {
    if [[ $# -ne 1 ]]; then
        echo "usage: usb <drive>"
    else
        sudo mkdir -p /run/media/rndmprsn
        sudo chown rndmprsn /run/media/rndmprsn
        sudo chgrp rndmprsn /run/media/rndmprsn
        sudo mount -rw -o 'exec' $1 /run/media/rndmprsn
    fi
}

alias cpf='cp -avr'
alias uniso='7z x'

alias rs='cd $WINEPREFIX/drive_c/Program\ Files\ \(x86\)/Rosetta\ Stone/Rosetta\ Stone\ Version\ 3; wine RosettaStoneVersion3.exe'

alias v='nvim'
alias vima='cd /home/rndmprsn/Code/Ante/ante && nvim src/main.rs'
alias ante='/home/rndmprsn/Code/Ante/ante/target/debug/ante'
alias ctest='cargo test -- --nocapture'

alias hugo='/home/rndmprsn/Code/Ante/website/hugo'

# export LLVM_SYS_100_PREFIX=$(llvmenv prefix)

# -c jpeg, xv, yuv
alias pkmn='optirun -c jpeg run_scaled --scale=4 wine /home/rndmprsn/Downloads/Pokemon\ Rejuvenation/Game.exe'

alias ncm='mpd; ncmpcpp'
alias screenshot='grim'

alias ping='ping -c 1 www.google.com'

alias bar='~/Code/bar/bar.sh'
alias vol='~/Code/pa-vol.sh'

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

# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# opam configuration
test -r /home/rndmprsn/.opam/opam-init/init.zsh && . /home/rndmprsn/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# nix-env config
# source /home/rndmprsn/.nix-profile/etc/profile.d/nix.sh
# export PATH="$HOME/.nix_profile/bin:$PATH"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	XKB_DEFAULT_LAYOUT=us exec sway
fi
