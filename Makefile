.PHONY: all clean
all: install

install: terminfo packer tpm

	mkdir -p ~/.config/{alacritty,fish,tmux}

	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml    ~/.config/alacritty/alacritty.yml
	[ -f ~/.config/fish/config.fish ]        || ln -s $(PWD)/config.fish      ~/.config/fish/config.fish
	[ -d ~/.config/nvim ]                    || ln -s $(PWD)/nvim             ~/.config/nvim
	[ -f ~/.config/tmux/tmux.conf ]          || ln -s $(PWD)/tmux.conf        ~/.config/tmux/tmux.conf
	[ -f ~/.config/starship.toml ]           || ln -s $(PWD)/starship.toml    ~/.config/starship.toml
	[ -f ~/.gitconfig ]                      || ln -s $(PWD)/gitconfig        ~/.gitconfig
	[ -f ~/.gitconfig.github ]               || ln -s $(PWD)/gitconfig.github ~/.gitconfig.github
	[ -f ~/.gitconfig.work ]                 || ln -s $(PWD)/gitconfig.work   ~/.gitconfig.work

	pip3 install pynvim --no-cache-dir

terminfo:

	infocmp tmux-256color > /dev/null 2>&1 || (curl -fLO https://invisible-island.net/datafiles/current/terminfo.src.gz; gunzip terminfo.src.gz; tic -xe tmux-256color terminfo.src; rm -f terminfo.src)

packer:

	[ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ] || git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

tpm:

	[ -d ~/.config/tmux/plugins/tpm ] || git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

sf_mono:

	rsync --ignore-existing /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SF-Mono-*.otf ~/Library/Fonts

fish_functions:

	[ -f ~/.config/fish/functions/music-dl.fish ] || git clone https://github.com/devald/fish-functions.git ~/.config/fish/functions

nerd_font:

	docker run --rm -v ~/Library/Fonts:/in -v ~/Library/Fonts:/out nerdfonts/patcher --complete

clean:

	rm -rf ~/.terminfo/74/tmux-256color
	rm -rf ~/.local/share/nvim/site/pack/packer
	rm -rf ~/.config/tmux/plugins
	rm -f  ~/.config/alacritty/alacritty.yml
	rm -f  ~/.config/fish/config.fish
	rm -rf ~/.config/nvim
	rm -f  ~/.config/tmux/tmux.conf
	rm -f  ~/.config/starship.toml
	rm -f  ~/.gitconfig
	rm -f  ~/.gitconfig.github
	rm -f  ~/.gitconfig.work

	pip3 uninstall -y pynvim
