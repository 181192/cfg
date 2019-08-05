# `cfg` - Store your dotfiles in a *bare* Git repository

No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate you configuration easily on new installation.

The technique consists in storing a Git bare repository in a "side" folder (like `$HOME/.cfg` or `$HOME/.myconfig`) using a specially crafted alias so that commands are run against that repository and not the usual `.git` local folder, which would interfere with any other Git repositories around.

> ### Example workflow
>```
>cfg status
>cfg add .vimrc
>cfg commit -m "Add vimrc"
>cfg push
>```

## Setup
```
curl -Lks https://raw.githubusercontent.com/181192/cfg/master/.scripts/setup.sh | /bin/bash
```

## `.bashrc.d` & `.bash_completion.d`
By utilizing two folders `.bashrc.d` and `.bash_completion.d`, all `bashrc` configuration and bash completions can be separated from the original `.bashrc` file. Leaving it nice and clean for expanding your configuration or cherry pick from this repo without needing to manage a massive big `.bashrc` file.