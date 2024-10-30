# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
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
# enable gmake as make
export PATH="/usr/local/opt/make/libexec/gnubin:${PATH}"
# rancher desktop
export PATH="${HOME}/.rd/bin:${PATH}"
# krew
export PATH="${PATH}:${HOME}/.krew/bin"

# GO BIN
if command -v go 1>/dev/null 2>&1; then
  export PATH=$(go env GOBIN):"${PATH}"
fi

# GO ENV vars
export GOPROXY="direct"
export GOPATH="/Users/chumich/go"
export GOBIN="/Users/chumich/go/bin"

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
# zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
# fpath=(~/.zsh $fpath)

#####################
# eksctl auto complete: https://eksctl.io/introduction/#zsh
#####################
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Z auto suggestions
[[ ! -f ~/.zsh/zsh-autosuggestions.zsh ]] || source ~/.zsh/zsh-autosuggestions.zsh

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
alias bbb='brazil-recursive-cmd --allPackages brazil-build release'

# Midway
alias mw='/usr/local/bin/mwinit -f -s'
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

alias port-open='lsof -i -P -n | grep LISTEN'

#######
# K8s #
#######
export KUBE_EDITOR="code --wait"
# kubecolor
# command -v kubecolor >/dev/null 2>&1 && alias kubectl="kubecolor"
# compdef kubecolor=kubectl # only needed for zsh
# export KUBECOLOR_OBJ_FRESH=12h # highlight resources newer than 12h

# kubectl
alias k='kubectl'
alias kdr='kubectl --dry-run=client -o yaml'
alias kgoy='kubectl get -o yaml'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods -A'
alias kci='kubectl cluster-info'
alias kc='kubectl config'
alias kcv='kubectl config view'
alias kcc='kubectl config current-context'
alias kuc='kubectl config use-context'
alias kgc='kubectl config get-contexts'
alias kccontext='kubectl config view | yq e ".contexts[].name" -'
alias ksetns='kubectl config set-context --current --namespace'
alias krf="kubectl patch -p '{\"metadata\":{\"finalizers\":null}}' --type=merge"
# Rover-CM
alias cm-logs='kubectl logs -n rover-cm-api `k-pod rover-cm-api` -c rover-cm-api-server'
alias cm-env='kubectl get -o yaml deployments -n rover-cm-api rover-cm-api-server | yq e ".spec.template.spec.containers[].env" -'
# CAP-Rover
alias capr-logs='kubectl logs -n capr-system `k-pod capr-system`'
alias capi-logs='kubectl logs -n capi-system `k-pod capi-system`'
alias capi-kb-logs='kubectl logs -n capi-kubeadm-bootstrap-system `k-pod capi-kubeadm-bootstrap-system`'
alias capi-kcp-logs='kubectl logs -n capi-kubeadm-control-plane-system `k-pod capi-kubeadm-control-plane-system`'

function k-pod() {
  kubectl get pods -n "$1" --field-selector=status.phase=Running -o jsonpath="{.items[0].metadata.name}"
}

function kunset () {
  local target=$1
  echo "kubectl config unset users.$target"
  kubectl config unset "users.$target"
  echo "kubectl config unset contexts.$target"
  kubectl config unset "contexts.$target"
  echo "kubectl config unset clusters.$target"
  kubectl config unset "clusters.$target"
}

function monitoring() {
  kubectl port-forward -n capi-system $(k-pod capi-system) 38080:8080 &
	kubectl port-forward -n capi-kubeadm-control-plane-system $(k-pod capi-kubeadm-control-plane-system) 38081:8080 &
	kubectl port-forward -n capi-kubeadm-bootstrap-system $(k-pod capi-kubeadm-bootstrap-system) 38082:8080 &
	kubectl port-forward -n capr-system $(k-pod capr-system) 38083:8080 &
	echo "Sleeping for 15 secs"
	sleep 15
	pushd ~/prometheus/
	./prometheus --config.file=prom.yml &
	popd
	/usr/local/opt/grafana/bin/grafana-server --config /usr/local/etc/grafana/grafana.ini --homepath /usr/local/opt/grafana/share/grafana --packaging=brew cfg:default.paths.logs=/usr/local/var/log/grafana cfg:default.paths.data=/usr/local/var/lib/grafana cfg:default.paths.plugins=/usr/local/var/lib/grafana/plugins
}

function kenv() {
  local namespace=$1
  local pod=$(k-pod "$namespace")
  local result=$(kubectl exec -it -n "$namespace" "$pod" -- env)
  echo "$result"
}

function k-all-image() {
  # https://kubernetes.io/docs/tasks/access-application-cluster/list-all-running-container-images/
  echo -e "kubectl get pods --all-namespaces -o jsonpath=\"{.items[*].spec['initContainers', 'containers'][*].image}\" | \\
    tr -s '[[:space:]]' '\\\n' | \\
    sort | \\
    uniq -c"
  kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec['initContainers', 'containers'][*].image}" | tr -s '[[:space:]]' '\n' | sort | uniq -c
}

function k-all-cr() {
  echo "=== EKSRoverCluster ==="
  kubectl get eksrovercluster -A
  echo "=== AWSClusterRoleIdentity.infrastructure.cluster.eks-rover.amazon.com ==="
  kubectl get AWSClusterRoleIdentity.infrastructure.cluster.eks-rover.amazon.com -A -o wide
  echo "=== Cluster ==="
  kubectl get cluster -A -o wide
  echo "=== OutpostCluster ==="
  kubectl get outpostcluster -A -o wide
  echo "=== KCP ==="
  kubectl get kubeadmcontrolplane -A -o wide
  echo "=== OutpostMachineTemplate ==="
  kubectl get outpostmachinetemplate -A -o wide
  echo "=== Machine ==="
  kubectl get machine -A -o wide
  echo "=== OutpostMachine ==="
  kubectl get outpostmachine -A -o wide
}

function k-ns-cr() {
  local ns=$1
  echo "=== EKSRoverCluster ==="
  kubectl get eksrovercluster $ns
  echo "=== AWSClusterRoleIdentity.infrastructure.cluster.eks-rover.amazon.com ==="
  kubectl get AWSClusterRoleIdentity.infrastructure.cluster.eks-rover.amazon.com $ns -o wide
  echo "=== Cluster ==="
  kubectl get cluster -n $ns -o wide
  echo "=== OutpostCluster ==="
  kubectl get outpostcluster -n $ns -o wide
  echo "=== KCP ==="
  kubectl get kubeadmcontrolplane -n $ns -o wide
  echo "=== OutpostMachineTemplate ==="
  kubectl get outpostmachinetemplate -n $ns -o wide
  echo "=== Machine ==="
  kubectl get machine -n $ns -o wide
  echo "=== OutpostMachine ==="
  kubectl get outpostmachine -n $ns -o wide
}

function klogs() {
  local namespace=$1
  local pod=$(kubectl get pods -n "$namespace" --field-selector=status.phase=Running -o jsonpath="{.items[0].metadata.name}")
  kubectl logs -f -n "$namespace" "$pod"
}

function awshydra() {
  local region=$1
  echo "assuming first param is region ${region}, calling aws gigahydrafrontend"
  aws gigahydrafrontend \
  --endpoint https://frontend.prod.${region}.hydratest.aws.a2z.com \
  --region ${region} ${@:2}
}

function cpi-running() {
  local profile=$1
  aws ec2 --profile "$1" describe-instances --filters "Name=tag-key,Values=kubernetes.io/cluster/*chumich*" "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].[InstanceId,Tags[?Key==`Name`].Value|[0]]' --output table
}

# ROVER OPS
alias connect-to-bastion='/Users/chumich/workplace/RoverOpsLib/src/AWSWesleyRoverOpsLib/scripts/local/rover-ops-connect-to-bastion'
###
### Default is --prod ###
# rover-ops-exec-ssm -r <region> --command exec-document --ssmDoc KubectlGetObjectAction --ssmDocParams kubectlParams='eksrovercluster -o wide'
###
alias rover-ops-exec-ssm='/Users/chumich/workplace/RoverOpsLib/src/AWSWesleyRoverOpsLib/scripts/local/rover-ops-exec-ssm'
alias roverctl='/Users/chumich/workplace/RoverOpsLib/src/AWSWesleyRoverOpsLib/scripts/local/rover-ops-exec-ssm --command exec-document --ssmDoc KubectlGetObjectAction'

alias rover-ops-connect-to-bastion='/Users/chumich/workplace/RoverOpsLib/src/AWSWesleyRoverOpsLib/scripts/local/rover-ops-connect-to-bastion'

# AWS
# regional skylens
export SKYLENS_API_GATEWAY_URL="https://08wop2glsj.execute-api.us-west-2.amazonaws.com/test"
export EKS_FE_API_GATEWAY_URL="https://xnjrf1wmgk.execute-api.us-west-2.amazonaws.com/test"
export EKS_FE_INTERNAL_API_GATEWAY_URL="https://e7g5z6r1x9.execute-api.us-west-2.amazonaws.com/test"
export ROVER_FE_API_GATEWAY_URL="https://73vr6adk42.execute-api.us-west-2.amazonaws.com/dev"
export ROVER_CM_API_GATEWAY_URL="https://2ik718kj2c.execute-api.us-west-2.amazonaws.com"
export BETA_EKS_FE="https://zz1uo90xkd.execute-api.us-west-2.amazonaws.com/beta"

function apigw() {
  echo "SKYLENS_API_GATEWAY_URL=$SKYLENS_API_GATEWAY_URL"
  echo "EKS_FE_API_GATEWAY_URL=$EKS_FE_API_GATEWAY_URL"
  echo "EKS_FE_INTERNAL_API_GATEWAY_URL=$EKS_FE_INTERNAL_API_GATEWAY_URL"
  echo "ROVER_FE_API_GATEWAY_URL=$ROVER_FE_API_GATEWAY_URL"
  echo "ROVER_CM_API_GATEWAY_URL=$ROVER_CM_API_GATEWAY_URL"
  echo "---"
  echo "BETA_EKS_FE=$BETA_EKS_FE"
}

function pf-cloud() {
  echo "ssh -N -L 8080:localhost:8080 chumich.aka.corp.amazon.com"
  ssh -N -L 8080:localhost:8080 chumich.aka.corp.amazon.com
}

# Pull /usr/local/bin to the front of search path (override whatever in .pyenv)
export PATH=/usr/local/bin:/usr/local/sbin:"${PATH}"

# Z
# . /Users/chumich/bin/z.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#####################
# aws cli auto complete
#####################
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

#################
# gopath vscode #
#################
function codego() {
    # start vscode, modifying GOPATH to include dependencies brought in by brazil
    GOPATH=$GOPATH:$(brazil-path run.gopath | sed -E 's/{[^}]+}//g') code .
}
# export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

export WS=~/workplace
export AWS_REGION=us-west-2
export AWS_ACCOUNT_ID=785380725963
export AWS_EC2_METADATA_DISABLED=true

# Hishtory Config:
export PATH="$PATH:/Users/chumich/.hishtory"
source /Users/chumich/.hishtory/config.zsh

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
