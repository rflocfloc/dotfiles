# Linux dotfiles

Personal dotfiles for terminal applications.

Clone repo in a `.dotfiles` directory

```shell
git clone git@github.com:rflocfloc/dotfiles.git ~/.dotfiles
```

and create symlink where you need or use [stow](https://www.gnu.org/software/stow/).

## Stow usage

Run `stow` followed by the *dotfile directory/ies* you want to link:

```shell
stow -S git tmux vim starship   # Stow links for git, tmux, vim, and starship
stow git tmux vim starship      # Alternative syntax for -S
stow -D git                     # Unlinks git files
stow -R vim                     # Unliks and re-Stow vim
```


