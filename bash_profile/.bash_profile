echo '
      (\(\  Good Morning 지 미
      (-.-)
      o_(")(")
      '

# terminal stuffz
alias bash='code ~/.bash_profile'
alias vimrc='code ~/.vimrc'
alias bundle='cd ~/.vim/bundle'
alias l='ls'
alias la='ls -a'
alias o='open .'
alias c='clear'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias md='mkdir -p'
alias rd='rmdir'
alias temp='curl wttr.in/denver'

# mkdir foo + cd foo
mcd() { 
  mkdir -p -- "$1" && cd -P -- "$1"
}

# turing navs
alias mod1='cd ~/turing/frontend/1module'
alias projects1='cd ~/turing/frontend/1module/projects'
alias mod2='cd ~/turing/frontend/2module'
alias projects2='cd ~/turing/frontend/2module/projects'
alias mod3='cd ~/turing/frontend/3module'
alias projects3='cd ~/turing/frontend/3module/projects'

# git
alias wows='touch README.md && git init && git add . && git commit -m "Initial commit" && hub create && git push -u origin master && hub browse'
alias wow='mkdir stylesheets && mkdir scripts && mkdir test && mkdir images && touch README.md && cp ~/turing/frontend/templates/.gitignore ./ && cp ~/turing/frontend/templates/index.html ./ && cp ~/turing/frontend/templates/main.css ./stylesheets && cp ~/turing/frontend/templates/reset.css ./stylesheets && git init && git add . && git commit -m "Initial commit" && hub create && git push -u origin master && hub browse'
alias gi='git init'
alias ga='git add'
alias gaa='git add -A'
alias gap='git add --patch'
alias grst='git reset'
alias gc='git commit'
alias gca='git commit --amend'
alias gcam='git commit --amend -m'
alias gcm='git commit -m'
alias gs='git status'
alias gb='git branch'
alias go='git checkout'
alias gob='git checkout -b'
alias gom='git checkout master'
alias gbd='git branch -d'
alias grmv='git rm -r --cached'
alias gp='git push'
alias gpo='git push origin'
alias gphm='git push heroku master'
alias gpm='git pull origin master'
alias grbp='git pull --rebase origin master'
alias grbi='git rebase -i'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
alias gd='git diff'
alias gf='git fetch'
alias gm='git merge'
alias gmm='git merge master'
alias gcl='git clone'
alias gr='git remote'
alias grv='git remote -v'
alias grro='git remote rm origin'
alias grao='git remote add origin'
alias gbr='git branch remote'
alias gl='git log'
alias glo='git log --oneline'
alias gg='git gui citool'
alias dab='git branch | grep -v "master" | xargs git branch -D'
alias hc='hub create'
alias hb='hub browse'

# npm / react
alias cov='npm test -- --coverage'
alias cra='create-react-app'

crap() {
  create-react-app "$1"
  cd "$1"
  cp ~/turing/frontend/templates/package.json ./
  cp ~/turing/frontend/templates/App.js ./src
  cp ~/turing/frontend/templates/index.js ./src
  cp ~/turing/frontend/templates/.eslintrc ./src
  cp ~/turing/frontend/templates/setupTests.js ./src
  mv ./src/App.css ./src/App.scss
  rm ./src/logo.svg
  rm ./src/registerServiceWorker.js
  npm i
  git init
  git add .
  git commit -m "Initial Commit"
  hub create
  git push origin master
  hub browse
}

crapr() {
  create-react-app "$1"
  cd "$1"
  cp ~/turing/frontend/templates/package.json ./
  cp ~/turing/frontend/templates/App.js ./src
  cp ~/turing/frontend/templates/routerIndex.js ./src
  cp ~/turing/frontend/templates/.eslintrc ./src
  cp ~/turing/frontend/templates/setupTests.js ./src
  mv ./src/App.css ./src/App.scss
  mv ./src/routerIndex.js ./src/index.js
  rm ./src/logo.svg
  rm ./src/registerServiceWorker.js
  npm i
  npm i -S react-router-dom
  git init
  git add .
  git commit -m "Initial Commit"
  hub create
  git push origin master
  hub browse
}

# craprx -> create-react-app w/ redux

# prompt functions
parseGitBranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

colorMyPrompt() {
  dirColor="\e[104m"
  branchColor="\e[42m"
  textStyle="\e[1m\e[4m"
  reset="\e[0m"
  spacer="🌀"
  tail="🐙▶"

  PS1="$dirColor\W$reset$spacer$textStyle$branchColor$(parseGitBranch)$reset$tail"
}

export PROMPT_COMMAND=colorMyPrompt
