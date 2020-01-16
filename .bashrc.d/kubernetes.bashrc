# Flux
alias f='fluxctl --k8s-fwd-ns=flux-system'
complete -F _complete_alias f


# Helm
source <(helm completion bash)


# Helm 3
alias helm3='XDG_CACHE_HOME=$HOME/.cache/helm3 XDG_CONFIG_HOME=$HOME/.config/helm3 XDG_DATA_HOME=$HOME/.local/share/helm3 helm3'
complete -F _complete_alias helm3
source <(helm3 completion bash)

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


# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Kubesh
export PATH="~/.kubesh/bin:$PATH"
