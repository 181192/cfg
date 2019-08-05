# Flux
alias f='fluxctl --k8s-fwd-ns=flux'
complete -F _complete_alias f


# Helm
source <(helm completion bash)


# Kompose
source <(kompose completion bash)


# Kubectl
source <(kubectl completion bash)

alias k=kubectl
complete -F _complete_alias k


# KUI
export PATH=~/privat/kui/bin:$PATH


# Istio
istioctl collateral completion --bash -o ~/.bashrc.d
source ~/.bashrc.d/istioctl.bash

alias i=istioctl
complete -F _complete_alias i


# Stern
source <(stern --completion=bash)
