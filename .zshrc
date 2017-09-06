
# Path to your oh-my-zsh installation.
export ZSH=/Users/yiduan34/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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

export PATH="$PATH:/Users/yiduan34/.rvm/gems/ruby-2.3.0@credit-card-api/bin:/Users/yiduan34/.rvm/gems/ruby-2.3.0@global/bin:/Users/yiduan34/.rvm/rubies/ruby-2.3.0/bin:/Users/yiduan34/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
export ZSH=$HOME/.oh-my-zsh
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export ARCHFLAGS="-arch x86_64"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

alias dcms="bundle exec rake db:drop db:create db:migrate db:seed"

export NODE_PATH=/usr/local/lib/node_modules

PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

########################## DIRECTORY ##########################
alias cdash="cd /Users/yiduan34/credit-card-dashboard"
alias cdapi="cd /Users/yiduan34/credit-card-api"
alias cdocs="cd /Users/yiduan34/avant-api-stubs"
alias cdfdr="cd ~/fdr_gateway"

alias cdab="cd ~/avant-basic"

########################## DOCKER #############################
if [[ "$(docker-machine status default)" == *"Running"* ]]; then
  export DOCKER_IP="$(docker-machine ip)"

  eval "$(docker-machine env default)"
fi

alias dbuild='docker build -t "$(basename $(pwd))" .'
alias dcleani='docker rmi $(docker images | grep "^<none>" | cut -d" " -f33)'
alias dshell='docker exec -it "$(basename $(pwd))" /bin/bash'
alias dockm="docker-machine"
alias dockc="docker-compose"
alias dockup="docker-compose up -d"
alias dockdown="docker-compose down"

########################## DEV #############################
alias bs="bin/start_development"
alias dcss="bundle exec rake db:drop db:create db:structure:load && bundle exec rake db:seed"
alias rake='noglob rake'
alias g="git"
alias be="bundle exec"
alias bu="bundle update --source"
alias rr="rubocop -D && rspec"
alias resh="source ~/.zshrc"
alias rs="bundle exec rspec --format=documentation"

# Account id
alias aid="echo -n 13eb460d-e381-45ce-bf81-cf0bb5f0aced | pbcopy"
# Customer id
alias cid="echo -n b62211e7-ed36-4aa0-9f0f-c4cead7e1c1f | pbcopy"
# Credit Card id
alias ccid="echo -n 7a3637a5-5d49-4bed-901c-c5ed53e63228 | pbcopy"

alias cov="open coverage/index.html"
alias plink="ln -s /var/pgsql_socket/.s.PGSQL.5432 /tmp/.s.PGSQL.5432"

export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
