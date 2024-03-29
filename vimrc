call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'roxma/vim-tmux-clipboard'
Plug 'sheerun/vim-polyglot'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/BufOnly.vim'
call plug#end()
""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
retab                           " Change all existing tab characters to spaces
set expandtab                   " Converting tabs to spaces
set tabstop=2                   " Insert 2 spaces for a tab
set shiftwidth=2                " Indent 2 columns in normal or visual mode
set listchars=tab:▸\ ,eol:¬     " Customise invisible characters
set scrolloff=10                " Five lines visible above and below the cursor
set mouse=a                     " Scroll with mouse
set number relativenumber       " Show line numbers and relative too
set noswapfile                  " Don't use swapfile
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set pumheight=10                " Completion window max size
set colorcolumn=81              " show 80 columns limit
set cursorline                  " Highlight cursor
set lazyredraw                  " Wait to redraw
set clipboard+=unnamedplus      " Accessing the system clipboard from Vim
set updatetime=100              " Reduce updatetime for vim-gitgutter
set shell=/usr/local/bin/fish   " Fish as default shell
set undofile                    " This enables us to undo files even if you exit Vim.

" Disable line numbers in term
autocmd TermOpen * setlocal nonumber norelativenumber

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Change cursor shape in different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" TrueColor
set termguicolors

" Colorscheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Remember last position in file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

" Exit on j
imap jj <Esc>

" disable arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" Shortcut to rapidly toggle `set list`
nnoremap <leader>h :set list!<CR>

" Automatically resize screens to be equally the same
autocmd VimResized * wincmd =

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" vim-airline/vim-airline

" smarter tab line
let g:airline#extensions#tabline#enabled=1
" powerline fonts
let g:airline_powerline_fonts=0
" enable tmuxline integration
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline-colors.conf"

" edkolev/tmuxline.vim

" powerline separators
let g:tmuxline_powerline_separators=0
" custom preset
let g:tmuxline_preset={
    \ 'a'      : '#S',
    \ 'b'      : '',
    \ 'c'      : '',
    \ 'win'    : '#I',
    \ 'cwin'   : '#I #F',
    \ 'x'      : '',
    \ 'y'      : '',
    \ 'z'      : '',
    \ 'options': {'status-justify': 'centre'}
    \ }

" christoomey/vim-tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1

" Yggdroot/indentLine

let g:indentLine_enabled=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" hashivim/vim-terraform

let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_fold_sections=1

" fatih/vim-go

" Jump to next error with up and previous error with down arrow key.
" Close the quickfix window with <leader>a
" nnoremap <down> :cnext<CR>
" nnoremap <up> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" let g:go_fmt_command = "goimports"
" let g:go_autodetect_gopath = 1
" let g:go_list_type = "quickfix"

" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1
" let g:go_auto_sameids = 1
" let g:go_highlight_fields = 1

" let g:go_doc_popup_window = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<CR>
imap <C-g> <esc>:<C-u>GoDeclsDir<CR>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" " scrooloose/nerdtree

" " open it
" map <leader>m :NERDTreeToggle<CR>
" " automatically close NerdTree when you open a file
" let NERDTreeQuitOnOpen=1
" " show hidden files
" let NERDTreeShowHidden=1
" " delete buffer without confimation
" let NERDTreeAutoDeleteBuffer=1
" " open on the right side
" let g:NERDTreeWinPos = "right"
" " close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" mattn/emmet-vim

" redefine trigger key
let g:user_emmet_leader_key='<C-e>'

" mhinz/vim-startify

" bookmark vim, tmux, fish configs
let g:startify_bookmarks = [
  \ {'c': '~/git/github/dotfiles/vimrc'}
  \ ]
" unicode characters for fortune header frame
let g:startify_fortune_use_unicode = 1
" change to the root directory of the VCS
let g:startify_change_to_vcs_root = 1
" update files on-the-fly
let g:startify_update_oldfiles = 1
" fast access for the plugin manager
let g:startify_commands = [
  \ {'m': ['update plugin manager', ':PlugUpgrade' ] },
  \ {'p': ['update plugins', ':PlugUpdate' ] },
  \ ]
" update session automatically
let g:startify_session_persistence = 1
" custom list on startup screen
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']       },
  \ { 'type': 'sessions',  'header': ['   Sessions']  },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
  \ { 'type': 'commands',  'header': ['   Commands']  },
  \ ]

" airblade/vim-gitgutter

" disable focus reports
let g:gitgutter_terminal_reports_focus = 0

" junegunn/fzf.vim

" Reverse layout
let $FZF_DEFAULT_OPTS = '--reverse'
" CtrlP key binding
nmap <C-p> :Files<CR>
" Buffer key binding
nmap <leader>; :Buffers<CR>
" Starting fzf in a popup window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" search with preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden --glob "!.git/*" '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" Prettier shortcut
command! -nargs=0 Prettier :CocCommand prettier.formatFile
