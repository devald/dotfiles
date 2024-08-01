# dotfiles
My personal dotfiles
## Usage
### Install brew bundle
#### Home related stuff
```shell
brew bundle --no-lock --file homebrew/home
```
#### Work related stuff
```shell
brew bundle --no-lock --file homebrew/work
```
### Manage dotfiles with Home Manager
```shell
home-manager switch --flake .
```
### Manage NixOS with flake
```shell
sudo nixos-rebuild switch --flake .
```
