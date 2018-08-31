# Path to your oh-my-zsh installation.
export ZSH=/Users/hawkins/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="spaceship"
ZSH_THEME="zeit"

# this generates a random cowsay character
function cowsay_random {
  cows=(`cowsay -l | grep -v '/'`)
  cow=${cows[$RANDOM % ${#cows[@]} ]}
  cowsay -n -f $cow "$@"
}

# Give me a dad joke! :D
function dadjoke {
  curl https://icanhazdadjoke.com/ --silent | cowsay_random
}
dadjoke

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/Users/hawkins/Documents/Games:/usr/local/texlive/2017/bin/x86_64-darwin:/usr/local/go/bin:/usr/local/go:/opt/metasploit-framework/bin:/Users/hawkins/go/src/github.com/huydx/hget/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Disable autocd
# unsetopt autocd

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias reload="source ~/.zshrc"
alias tdnotes="vim /Users/hawkins/Documents/notes.txt"
# alias logout="sudo pkill -KILL -u hawkins"
export hawkins="https://github.com/hawkins"
export github="https://github.com"
export eli="https://github.com/elicdavis"
alias git="hub"
alias "git create"="sudo hub create"
alias "thrust"="git push -f"
alias up="git add -up"
alias trimbranches="git branch --merged | egrep -v '(^\*|master|dev|develop)' | xargs git branch -d"

# Android Studio / React Native things
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Facebook <3 terminal
alias cra="create-react-app"
alias crna="create-react-native-app"

# React codemods
export codemods="/Users/hawkins/git/react-codemod/transforms"

# Random aliases
alias deps="npm list --depth=0"
alias tree="tree -I node_modules"

# Hawkins.is
#export MONGO_USER="site"
#export MONGO_PASS="IPM95LNPtLaR"


# Spaceship ZSH theme
# installed via npm i -g spaceship-zsh-theme
# source "/Users/hawkins/.oh-my-zsh/custom/themes/spaceship.zsh-theme"


# Ruby
eval "$(rbenv init -)"

# Rust
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
# https://github.com/rust-lang-nursery/rustfmt/issues/1707#issuecomment-310005652
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH


# LLVM
# To use the bundled libc++ please add the following LDFLAGS:
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
# installed via `brew install llvm`
# This formula is keg-only, which means it was not symlinked into /usr/local,
#   because macOS already provides this software and installing another version in
#   Parallel can cause all kinds of trouble.
# If you need to have this software first in your PATH run:
export PATH="/usr/local/opt/llvm/bin:$PATH"
# For compilers to find this software you may need to set:
#   LDFLAGS:  -L/usr/local/opt/llvm/lib
#   CPPFLAGS: -I/usr/local/opt/llvm/include

# Add fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add bat preview
alias preview="fzf --preview 'bat --color \"always\" {}'"

# Kill ports more easily on my mac
stop() {
  lsof -t -i tcp:$1 | xargs kill
}
alias stfu=stop
