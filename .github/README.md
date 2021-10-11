# Dotfiles & NixOS configuration

This repo stores all of my dotfiles in a bare repo, including Nix/NixOS config files.

## Installation

I'm using a bare repo to store these dotfiles, so deploying it is relatively straightforward. You just have to be sure to specify to clone it as a bare repo, and then replace `/etc/nixos` with a symlink to `~/.config/nixos`.

```fish
git clone --separate-git-dir=~/.dotfiles https://github.com/brlodi/dotfiles-nixos ~

# If setting up a NixOS system
sudo rm -r /etc/nixos
sudo ln -s ~/.config/nixos /etc/nixos
```

## Acknowledgements

### References / Inspiration

- [Modularized Awesome Configuration](https://gitlab.com/epsi-rns/dotfiles/-/tree/master/awesome/4.3) &mdash; [Epsi R Nurwijayadi](http://epsi-rns.github.io/)

### Awesome WM components

- [awesome-freedesktop](https://github.com/lcpz/awesome-freedesktop)