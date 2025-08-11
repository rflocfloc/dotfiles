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
