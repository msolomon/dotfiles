# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load (~/.oh-my-zsh/themes/)
ZSH_THEME="robbyrussell"


export ZSH_TMUX_AUTOCONNECT=false

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew osx python sublime autojump virtulenvwrapper tmux supervisor pip osx npm coffee rails ruby zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt correct
unsetopt correct_all

alias rezsh="source ~/.zshrc"
alias rezesh="source ~/.zshrc"
alias zsh="subl ~/.zshrc"

alias s.="subl ."
alias pc="nocolor /Users/mike/pidcat/pidcat.py com.wonder.debug"
# alias ss="print_and_eval(rails server --binding 127.0.0.1)"
alias ss='echo'
alias tree="tree -C"

alias nocolor="DYLD_INSERT_LIBRARIES=''"
alias xit="exit"


## git 

alias gcurrbranch='git rev-parse --abbrev-ref HEAD'
alias gd="git diff -b"

function print_and_eval() {
    echo "\e[0;37m$1\e[0m"
    eval $1
}

function gupush() {
    print_and_eval "git push -u origin $(gcurrbranch)"
}

function gpush() {
    print_and_eval "git push origin $(gcurrbranch)"
}

function gpull() {
    print_and_eval "git pull origin $(gcurrbranch)"
}

function gprebase() {
    print_and_eval "git pull --rebase origin $(gcurrbranch)"
}

function gdeletemerged() {
    git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d
}

function gsub() {
    git submodule sync --recursive
    git submodule update --init --recursive
}


## flesh

function fleshdb()
{
    postgres -D .db -r /tmp/flesh-postgres.log -p 5454 &
}

function fleshdump()
{
    pg_dump -U postgres -p 5454 -O -s -f ~/flesh/db/schema.sql flesh_local
    pg_dump -U postgres -p 5454 -O -a -t event_type -t event_role -f ~/flesh/db/base_data.sql flesh_local 
}


## General

function f()
{
    find . -iname "*$@*"
}

function fr()
{
    find -E . -iregex $@
}

function r()
{
    grep $@ -R .
}

case "$TERM" in
    screen*)
        precmd () {
            print -Pn "33k$(hostname -s)33\\"
        }
    ;;
esac

source ~/.venvburrito/startup.sh

export LOLCOMMITS_FORK=true

# pegasus
export ANDROID_HOME="/Applications/Android Studio.app/sdk"
export NDK_BUILD="/Users/mike/android-ndk-r9"
export ANDROID_NDK_HOME="/Users/mike/android-ndk-r9"

export GOPATH=/Users/mike/.golibs
export PATH=/Users/mike/bin:/Users/mike/anaconda/bin:/usr/local/Cellar/gdb/7.6/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/Users/mike/.golibs/bin:.:/Users/mike/android-ndk-r9:/Applications/Android\ Studio.app/sdk/platform-tools:/Applications/Android\ Studio.app/sdk/tools:/Users/mike/.rvm/bin:/usr/local/sbin:$PATH
export DYLD_INSERT_LIBRARIES="/Users/mike/.stderred/build/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:$DYLD_INSERT_LIBRARIES}"
export STDERRED_BLACKLIST="^(bash|TexturePacker|cmake|brew|rabbitmq-server|sudo|gradle|gradlew|adb|sudo|./testDebug).*"
export DJANGO_COLORS="dark"
export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
