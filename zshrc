########
# PATH #
########
# export PATH=/Library/Android/sdk/platform-tools:"${PATH}"
# export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
# export PATH=/usr/local/bin:/usr/local/sbin:"${PATH}"
export PATH=~/bin:"${PATH}"

#######
# ENV #
#######
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

#################
# Prompt config #
#################
export PS1="%15F%B>%*%b%f %10F[%~]%8F%#%f "

#########
# Alias #
#########
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

##########
# Amazon #
##########
export ACD=chumich.aka.corp.amazon.com

# Amazon BuilderToolbox
export PATH=$HOME/bin:$HOME/.toolbox/bin:$PATH
# python packages
export PATH=$HOME/Library/Python/2.7/bin:$PATH

# odin
alias odin="ssh -L 2009:localhost:2009 chumich.aka.corp.amazon.com -f -N"
export PATH=$PATH:/Volumes/Unix/workplace/.odin-tools/env/OdinRetrievalScript-1.0/runtime/bin
# to update odin tools see: https://w.amazon.com/index.php/OdinOnMac

# Brazil
alias bb=brazil-build
alias bws='brazil ws'

# Midway
alias mw='/usr/local/bin/mwinit -o'

# Work Doc
alias workdoc='cd /Users/chumich/Amazon\ WorkDocs\ Drive/My\ Documents/'

# Z
. /Users/chumich/bin/z.sh
