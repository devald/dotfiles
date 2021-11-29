.PHONY: all clean
all: install

install: terminfo

	mkdir -p ~/.config/{alacritty,fish,nvim}

	[ -f ~/.config/alacritty/alacritty.yml ]					|| ln -s $(PWD)/alacritty.yml 	  ~/.config/alacritty/alacritty.yml
	[ -f ~/.config/fish/config.fish ]									|| ln -s $(PWD)/config.fish 		  ~/.config/fish/config.fish
	[ -f ~/.config/nvim/init.vim ]										|| ln -s $(PWD)/vimrc 					  ~/.config/nvim/init.vim
	[ -f ~/.config/nvim/coc-settings.json ]						|| ln -s $(PWD)/coc-settings.json ~/.config/nvim/coc-settings.json
	[ -f ~/.tmux.conf ]																|| ln -s $(PWD)/tmux.conf 			  ~/.tmux.conf
	[ -f ~/.gitconfig ]															 	|| ln -s $(PWD)/gitconfig 			  ~/.gitconfig
	[ -f ~/.gitconfig.github ]												|| ln -s $(PWD)/gitconfig.github  ~/.gitconfig.github
	[ -f ~/.gitconfig.work ]													|| ln -s $(PWD)/gitconfig.work 	  ~/.gitconfig.work

	[ -f ~/.local/share/nvim/site/autoload/plug.vim ] || curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
																											   --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	[ -f ~/.config/base16-shell/profile_helper.fish ] || git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	[ -f ~/.config/fish/functions/music-dl.fish ]			|| git clone https://github.com/devald/fish-functions.git 		~/.config/fish/functions

	pip3 install pynvim --no-cache-dir

	nvim +PlugInstall +q +q
	nvim +'CocInstall coc-json coc-yaml coc-prettier' +q +q

terminfo: fonts

	infocmp tmux-256color > /dev/null 2>&1 || (curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz; gunzip terminfo.src.gz; tic -xe tmux-256color terminfo.src; rm -f terminfo.src)
	infocmp alacritty 		> /dev/null 2>&1 || (curl -LO https://raw.githubusercontent.com/jwilm/alacritty/master/extra/alacritty.info; tic -xe alacritty,alacritty-direct alacritty.info; rm -f alacritty.info)

fonts:

	rsync --ignore-existing /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SF-Mono-*.otf ~/Library/Fonts

clean:

	rm -f ~/Library/Fonts/SF-Mono-*.otf
	rm -rf ~/.terminfo

	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.config/fish/config.fish
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.config/nvim/coc-settings.json
	rm -f ~/.tmux.conf
	rm -f ~/.gitconfig
	rm -f ~/.gitconfig.github
	rm -f ~/.gitconfig.work
	rm -f ~/.local/share/nvim/site/autoload/plug.vim*
	rm -rf ~/.config/base16-shell
	rm -rf ~/.config/fish/functions

	pip3 uninstall -y pynvim
