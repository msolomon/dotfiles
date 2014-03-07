# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load (~/.oh-my-zsh/themes/)
ZSH_THEME="robbyrussell"

export ZSH_TMUX_AUTOCONNECT=true
COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins can be found in ~/.oh-my-zsh/plugins/* and ~/.oh-my-zsh/custom/plugins/
plugins=(git brew osx python sublime autojump virtulenvwrapper tmux supervisor pip osx npm coffee rails ruby rvm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source $HOME/.venvburrito/startup.sh

unsetopt correct
unsetopt correct_all

alias rezsh="source ~/.zshrc"
alias rezesh="source ~/.zshrc"
alias zsh="subl ~/.zshrc"

alias s.="subl ."
alias ss="print_and_eval 'rails server --binding 127.0.0.1'"
alias tree="tree -C"

alias nocolor="DYLD_INSERT_LIBRARIES=''"
alias xit="exit"

function print_and_eval() {
    echo "\e[0;37m$1\e[0m"
    eval $1
}



## git 

alias gcurrbranch='git rev-parse --abbrev-ref HEAD'
alias gd="git diff -b"

function gupush() { print_and_eval "git push -u origin $(gcurrbranch)" }
function gpush() { print_and_eval "git push origin $(gcurrbranch)" }
function gpull() { print_and_eval "git pull origin $(gcurrbranch)" }
function gprebase() { print_and_eval "git pull --rebase origin $(gcurrbranch)" }

function gdeletemerged() {
    git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d
}

function gsub() {
    print_and_eval "git submodule sync --recursive"
    print_and_eval "git submodule update --init --recursive"
}

## Search

function f() { print_and_eval "find . -iname \"*$@*\"" }
function fr() { print_and_eval "find -E . -iregex $@" }
function r() { print_and_eval "grep \"$@\" -R ." }

## Android
export ANDROID_HOME="/Applications/Android Studio.app/sdk"
export NDK_BUILD="$HOME/android-ndk-r9"
export ANDROID_NDK_HOME="$HOME/android-ndk-r9"

function pc() { print_and_eval "nocolor $HOME/pidcat/pidcat.py com.wonder.debug" }

## General

export LOLCOMMITS_FORK=true
export DJANGO_COLORS="dark"

export PATH=/Users/mike/bin:/Users/mike/anaconda/bin:/usr/local/Cellar/gdb/7.6/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/Users/mike/.golibs/bin:.:/Users/mike/android-ndk-r9:/Applications/Android\ Studio.app/sdk/platform-tools:/Applications/Android\ Studio.app/sdk/tools:/Users/mike/.rvm/bin:/usr/local/sbin:$PATH
export GOPATH=/Users/mike/.golibs
export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads

export DYLD_INSERT_LIBRARIES="$HOME/.stderred/build/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:$DYLD_INSERT_LIBRARIES}"
export STDERRED_BLACKLIST="^(bash|TexturePacker|cmake|brew|rabbitmq-server|sudo|gradle|gradlew|adb|sudo|./testDebug).*"
