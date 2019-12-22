# PATH
# export PATH=/Library/Android/sdk/platform-tools:"${PATH}"
# export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
# export PATH=/usr/local/bin:/usr/local/sbin:"${PATH}"
export PATH=~/bin:"${PATH}"

# ENV
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

# Prompt config
export PS1="%15F%B>%*%b%f %10F[%~]%8F%#%f "

# Alias
alias ls='ls -F'
alias ll='ls -al'
alias la='ls -A'
alias lr='ls -hartl'
alias grep='grep --color=auto'
alias gl='git lg'
alias diffc='code --wait --diff'

# Git auto-complete
# see: https://medium.com/@oliverspryn/adding-git-completion-to-zsh-60f3b0e7ffbc
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Load rbenv
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Load pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
