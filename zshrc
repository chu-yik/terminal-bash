# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias cr-mainline='REMOTE_TARGET_BRANCH=mainline cr --parent origin/mainline'

#####################
# Git auto-complete #
#####################
# see: https://medium.com/@oliverspryn/adding-git-completion-to-zsh-60f3b0e7ffbc
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

#########
# rbenv #
#########

# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following to your ~/.zshrc:
# Note: this may interfere with building old versions of Ruby (e.g <2.4) that use OpenSSL <1.1.
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

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
alias bba='brazil-build apollo-pkg'
alias bws='brazil ws'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bbr='brazil-recursive-cmd brazil-build'
alias bbb='brazil-recursive-cmd --allPackages brazil-build'

# Midway
alias mw='/usr/local/bin/mwinit -o'
alias carpediem='kinit -f && mw'

# Work Doc
alias workdoc='cd /Users/chumich/Amazon\ WorkDocs\ Drive/My\ Documents/'

############
# AMZN VPN #
############
alias vpn='~/bin/vpn-onetouch'
alias vpns='/opt/cisco/anyconnect/bin/vpn status'
alias vpnd='/opt/cisco/anyconnect/bin/vpn disconnect'

#########
# NINJA #
#########
alias nds='/usr/local/bin/ninja-dev-sync'
alias ninja='/usr/local/bin/ninja-dev-sync -setup'

# bastion ProxyCommand override, for Corp hosts
alias ssho='ssh -o ProxyCommand=none'

# Z
# . /Users/chumich/bin/z.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
