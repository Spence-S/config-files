# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
# Path additions
export ZSH_DISABLE_COMPFIX="true"
export ZSH="/Users/spencer/.oh-my-zsh"
export PATH=/usr/local/opt/mongodb-community@3.4/bin:/usr/local/sbin:$PATH
export PATH=~/.npm-global/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export BAT_THEME=Dracula

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# enable oh-my-zsh plugins
plugins=(
  git 
  sudo 
  yarn 
  docker 
  docker-compose 
  ansible
  colored-man-pages
)

# import oh-my-zsh
source $ZSH/oh-my-zsh.sh
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="exa -T -L=1 -I=node_modules -la --icons"
alias tree="tree -I 'node_modules'"
alias fixkraken="codesign --remove-signature /Applications/GitKraken.app/Contents/Frameworks/GitKraken\ Helper\ \(Renderer\).app"
alias oh="cd ~/Projects/ourharvest"
alias ourharvest=oh
alias cat=bat
alias vim=nvim

# iterm tab title
# https://gist.github.com/phette23/5270658#gistcomment-3530342
if [ $ITERM_SESSION_ID ]; then
  DISABLE_AUTO_TITLE="true"
  precmd() {
    # sets the tab title to current dir
    echo -ne "\e]1;${PWD##*/}\a"
  }
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
