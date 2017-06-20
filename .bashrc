
export PS1="\[\e[35m\]@\[\e[m\]\[\e[35m\]\W\[\e[m\] \[\e[35m\]\\$\[\e[m\]\[\e[35m\]:\[\e[m\] "

export PATH="$PATH:`yarn global bin`"

export NVM_DIR="/Users/Spencer/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source ~/.profile
