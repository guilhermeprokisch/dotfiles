# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose poetry git)

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


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

p() {
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        ca "$1"
        cd ~/Projects/"$1"
    else
        cd ~/Projects/
    fi
}

pp() {
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        cd ~/Playground/"$1"
    else
        cd ~/Playground/
    fi
}

cc() {
    if [ -n "$1" ]
    then
        conda create -n "$1" python=3.7 ipykernel -y -q
        conda activate "$1"
        python -m ipykernel install --user --name "$1" --display-name 'Python ('$1')'
    else
        echo 'Insert env name!'
    fi
}


ca() {

    if [ -n "$1" ]
    then
        conda activate "$1"
    else
        echo 'Insert env name!'
    fi
}

cr(){
    if [ -n "$1" ]
    then
        conda remove --name "$1" --all -y
    else
        echo 'Insert env name!'
    fi
}

cx(){
    conda deactivate
}

cl(){
    conda env list
}

update(){
    source ~/.zshrc
}

edit(){
    vim ~/.zshrc
}

vimrc(){
    vim ~/.vimrc
}

tmuxconf(){
    vim ~/.tmux.conf
}

j(){
    jupyter lab
}

pipi(){

    if [ -n "$1" ]
    then
        pip install "$1"
    else
        echo 'Insert package name!'
    fi
}

m() {
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        cx
        cd ~/Projects/movva/"$1"/notebooks/
        ca $1
    else
        cd ~/Projects/
    fi
}

mj() {
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        cx
        cd ~/Projects/movva/"$1"/notebooks/
        ca $1
        j
    else
        cd ~/Projects/
    fi
}

sr() {
    pip install -e .
    streamlit run app/app.py --browser.serverAddress 0.0.0.0 --browser.serverPort 80 --server.port 80
}

tunnel() {
    if [ -n "$1"  ]
    then
        lt -h "http://serverless.social" -p "$1" --subdomain "$2"
    else
        echo 'Insert port and name!'
    fi
}

mc(){
    if [ -n "$1"  ]
    then
        p movva
        cc "$1"
        putup --movva "$1"
        cd ./"$1"
    else
        echo 'Insert project name!'
    fi
}


gconf(){
    if [ -n "$1"  ]
    then
        gcloud config configurations activate "$1"
    else
        gcloud config configurations list
    fi
}


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/guilherme/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/guilherme/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/guilherme/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/guilherme/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$PATH:$HOME/Projects/simple_ocr/flutter/bin"

export AWS_ACCESS_KEY_ID=AKIAUHJHWBGKLEIH6UJ7
export AWS_SECRET_ACCESS_KEY=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
export AWS_REGION=eu-west-2
export AWS_DEFAULT_REGION=eu-west-2
export AWS_PROFILE=default
export GOOGLE_APPLICATION_CREDENTIALS="./certs/gcp.json"
source /Users/guilherme/.rvm/gems/ruby-2.7.0/gems/colorls-1.4.1/lib/tab_complete.sh
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree --depth 1'
alias c='clear'


i() {
        if [[ $ITERM_PROFILE == "Light" ]]; then
            export ITERM_PROFILE="Dark"
            echo -ne "\033]50;SetProfile=Dark\a"
        else
            export ITERM_PROFILE="Light"
            echo -ne "\033]50;SetProfile=Light\a"
        fi
}

sith() {
        val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
        if [[ $val == "Dark" ]]; then
            i
        fi
}

export EDITOR=vim
alias v='vim'


gla() {
        gcloud config configurations list
}

sga() {
        gcloud config configurations activate $1
}


aconda() {
        if [[ "$PWD" =~ "guilherme\/Projects" ]]; then
                ca "${PWD##*/}"
        fi
}

dot(){
        vim ~/.$1
}

alias glol=''
alias glod=''

PATH="/anaconda3/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/guilherme/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/guilherme/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/guilherme/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/guilherme/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
alias ls='lsd'
alias ls="lsd --tree --depth 1"
set -o vi


export CLOUDSDK_PYTHON=/usr/bin/python3     # on mac
export PATH="/usr/local/opt/openjdk/bin:$PATH"

function commit() {
    git add .
    git commit -a -m "$1"
    git push
}

alias magic1='ssh -t guilherme.prokisch@34.68.250.27 "cd ~/shipbob; bash"'

export PATH="$HOME/.poetry/bin:$PATH"

# Created by `pipx` on 2021-06-14 20:57:29
export PATH="$PATH:/Users/guilherme/.local/bin"

function code-remote {
  p=$(printf "%s" "$1" | xxd -p) && code --folder-uri "vscode-remote://dev-container+${p//[[:space:]]/}/$2"
}

alias da='docker exec -ti -w ${PWD} ${PWD##*/} zsh'
