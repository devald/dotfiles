# dotfiles
My personal dotfiles
## Usage
### Install brew bundle
#### Homebrew related stuff
```shell
brew bundle --no-lock --file homebrew/Brewfile
```
### Manage dotfiles with Home Manager
```shell
home-manager switch --flake .
```
### Manage NixOS with flake
```shell
sudo nixos-rebuild switch --flake .
```

### Build a custom bootable NixOS USB installer

```shell
nix build .#nixosConfigurations.usb-installer.config.system.build.isoImage
```
