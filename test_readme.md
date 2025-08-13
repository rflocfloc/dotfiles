# README
git configuration file.

Manual symlink:
```shell
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitconfig_personal ~/.gitconfig_personal
ln -s ~/.dotfiles/git/.gitconfig_work ~/.gitconfig_work
```
# README

`bashrc` extension directory.
Add to bashrc the following code:

```shell
# User extensions bashrc scripts
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
```

Manual symlink:
```shell
ls -s ~/.dotfiles/.bashrc.d ~/.bashrc.d
```
# README

[starship prompt](https://starship.rs/) configuration file.

Manual symlink:
```shell
mkdir -p ~/.config && ln -s ~/.dotfiles/starship/config/starship.toml ~/.config/starship.toml
```
# README
tmux configuration file.

Manual symlink:
```shell
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```
# README
vim configuration file.

Manual symlink:
```shell
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
```
