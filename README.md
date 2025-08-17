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

## Manual symlinks

Manual symlink instructions:

### git
```shell
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitconfig_personal ~/.gitconfig_personal
ln -s ~/.dotfiles/git/.gitconfig_work ~/.gitconfig_work
```

### jj
```shell
ln -s ~/.dotfiles/jj/.config/jj/ ~/.config/jj
ls -s ~/.dotfiles/jj/.bashrc.d/* ~/.bashrc.d/
```

### bash
```shell
mkdir -p ~/.bashrc.d
ls -s ~/.dotfiles/shell/.bashrc.d/* ~/.bashrc.d/
```

### starship
[starship prompt](https://starship.rs/) configuration file.

```shell
mkdir -p ~/.config
ln -s ~/.dotfiles/starship/config/starship.toml ~/.config/starship.toml
ls -s ~/.dotfiles/starship/.bashrc.d/* ~/.bashrc.d/
```
### tmux

```shell
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

### vim

```shell
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
```

### nvim

```shell
ln -s ~/.dotfiles/nvim/.config/nvim/ ~/.config/nvim
```
