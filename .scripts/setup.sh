#!/bin/bash

BASHRC_FILE="$HOME"/.bashrc

# 'END' to prevent the variable from expanding
BASHRC_CONFIG=$(cat <<'END'
for file in $HOME/.bashrc.d/*.bashrc; do
  [ -f "$file" ] && source "$file"
done
END
)

BASH_COMPLETION_CONFIG=$(cat <<'END'
for bcfile in $HOME/.bash_completion.d/*.bash_completion; do
  [ -f "$bcfile" ] && source "$bcfile"
done
END
)

function cfg {
  /usr/bin/git --git-dir="$HOME"/.cfg/ --work-tree="$HOME" "$@"
}

function searchConfig {
  local config="$1"
  local bashrc="$2"
  local name="$3"

  local bashrc_file
  bashrc_file="$(<"$2")"

  if [[ "$bashrc_file" = *"$config"* ]]; then
    echo -e "\e[93mConfig already exists for $name\e[0m"
  else
    echo "" >> "$bashrc"
    printf '%s\n' "$config" >> "$bashrc"
    echo -e "\e[32mAdded $name config to $bashrc\e[0m"
  fi
}

if [ ! -d "$HOME/.cfg" ]; then
  echo -e "\e[36mRepository does not exists, cloning now...\e[0m"
  git clone --bare git@github.com:181192/cfg.git "$HOME"/.cfg
fi

mkdir -p .cfg-backup

if ! cfg checkout -q; then
  echo -e "\e[93mBacking up pre-existing dot files\e[0m"
  cfg checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} .cfg-backup/{}
else
  echo -e "\e[36mChecked out config\e[0m"
fi

cfg checkout
cfg config status.showUntrackedFiles no

searchConfig "$BASHRC_CONFIG" "$BASHRC_FILE" "bashrc"
searchConfig "$BASH_COMPLETION_CONFIG" "$BASHRC_FILE" "bash_completions"

source "$BASHRC_FILE"
echo -e "\e[36mSourced $BASHRC_FILE\e[0m"
