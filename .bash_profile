source ~/.profile

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
alias cdots="cd ~/dotfiles"
alias repo_name='basename "$(git rev-parse --show-toplevel)"'
alias current_branch='git rev-parse --abbrev-ref HEAD'
alias g="git"
alias plink="ln -s /var/pgsql_socket/.s.PGSQL.5432 /tmp/.s.PGSQL.5432"

########################## RUBY ############################
alias be="bundle exec"
alias bu="bundle update --source"
alias rr="rubocop -D && rspec"
alias rake='noglob rake'
alias resh="source ~/.zshrc"
alias rs="bundle exec rspec --format=documentation"
alias cov="open coverage/index.html"
alias dcss="bundle exec rake db:drop db:create db:structure:load && bundle exec rake db:seed"
alias dcms="bundle exec rake db:drop db:create db:migrate db:seed"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
