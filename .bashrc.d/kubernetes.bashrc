# Flux
source <(fluxctl completion bash)
alias f='fluxctl --k8s-fwd-ns=flux-system'
complete -F _complete_alias f


# Helm
source <(helm completion bash)


# Helm 2
complete -F _complete_alias helm2
source <(helm2 completion bash)

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

# Linkerd
export PATH="~/.linkerd2/bin:$PATH"
source <(linkerd completion bash)

# Kubebuilder
export PATH=/usr/local/kubebuilder/bin:$PATH

