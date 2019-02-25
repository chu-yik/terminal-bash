export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PATH=/Library/Android/sdk/platform-tools:"${PATH}"
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
export PATH=/usr/local/bin:/usr/local/sbin:"${PATH}"
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
alias ls='ls -F'
alias ll='ls -alF'
alias la='ls -A'
alias adm='./Library/Android/sdk/tools/monitor'
#alias adb='./Library/Android/sdk/platform-tools/adb'
#PS1='\[\e[1;37m\]>\t \]\[\e[0;32m\][\u @ \h \W]\$\[\e[0m\] '
PS1='\[\e[1;37m\]>\t \[\e[0;32m\][\u @ \h \W]\$\[\e[0m\] '
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mc/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/mc/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mc/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/mc/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# Use git auto-complete
if [ -f ~/git-completion.bash ]; then source ~/git-completion.bash; fi
