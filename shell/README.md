# README

Aliases to add to bashrc.
Add to bashrc the following code:

```
if [ -f ~/.dotfiles/bash_aliases ]; then
    . ~/.dotfiles/bash_aliases
fi
```

You can do that with:
```
echo -e "## external aliases \nif [ -f ~/.dotfiles/shell/bash_aliases ]; then \n\t. ~/.dotfiles/shell/bash_aliases \nfi" >> ~/.bashrc
```
