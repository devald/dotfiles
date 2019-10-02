all: install

install: terminfo

	mkdir -p ~/.config/{alacritty,fish,nvim}

	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/config.fish ~/.config/fish/config.fish
	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship.toml ~/.config/starship.toml
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/vimrc ~/.config/nvim/init.vim
	[ -f ~/.config/nvim/coc-settings.json ] || ln -s $(PWD)/coc-settings.json ~/.config/nvim/coc-settings.json
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.local/share/nvim/site/autoload/plug.vim ] || curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
		--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	pip3 install --upgrade pynvim
	nvim +PlugInstall +q +q

clean:

	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.config/fish/config.fish
	rm -f ~/.config/starship.toml
	rm -f ~/.tmux.conf
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.config/nvim/coc-settings.json
	rm -f ~/.gitconfig
	rm -f ~/.local/share/nvim/site/autoload/plug.vim
	rm -rf ~/.terminfo

terminfo:

	curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz
	gunzip terminfo.src.gz
	tic -xe tmux-256color terminfo.src
	rm -f terminfo.src

	curl -LO https://raw.githubusercontent.com/jwilm/alacritty/master/extra/alacritty.info
	tic -xe alacritty,alacritty-direct alacritty.info
	rm -f alacritty.info

.PHONY: all clean install
