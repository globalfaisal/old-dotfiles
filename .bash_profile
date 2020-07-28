HOST_NAME=MacbookPro13

source ~/.nvm/nvm.sh
nvm use stable
shopt -s autocd
shopt -s histappend

export PATH=$PATH:$HOME/bin

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Colors
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldyel='\e[1;33m' # Bold Yellow
txtrst='\e[0m'    # Text Reset

emojis=("🛶" "🍏" "🦎" "🥗" "🌱" "🐉" "🌵")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    user_host="$USER@$HOST_NAME"
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    
    printf "\n $txtgrn%s: $bldyel%s $txtred%s\n$txtrst" "$user_host" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Styling the prompt
#PS1='\n'                       # new line
PS1="\[\033[32m\]"             # change to green
PS1="$PS1"' └──'               # add └── character
PS1="$PS1"'\[\033[32m\]'       # change to green
PS1="$PS1"' $EMOJI '           # prompt: emoji 😀
PS1="$PS1"'\[\033[32m\]'       # change to green
PS1="$PS1"'➤  '                # forward arrow
PS1="$PS1"'\[\033[0m\]'        # change to white


function mkcd()
{
	mkdir $1 && cd $1
}

# -------
# Aliases
# -------
alias 🧪="git checkout -b experimental"
alias vsc='code .'
alias ns='npm start'
alias nr='npm run'
alias nis='npm i -S'
alias nid='npm i -D'
alias l="ls" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias cl="clear" 

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'

# auto added by nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
