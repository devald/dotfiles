call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'hashivim/vim-terraform'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mhinz/vim-startify'
Plug 'roxma/vim-tmux-clipboard'
Plug 'vim-scripts/BufOnly.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
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
set number                      " Show line numbers
set noswapfile                  " Don't use swapfile
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set pumheight=10                " Completion window max size
set colorcolumn=81              " show 80 columns limit
set cursorline                  " Highlight cursor
set lazyredraw                  " Wait to redraw
set clipboard=unnamed           " Accessing the system clipboard from Vim
set updatetime=100              " Reduce updatetime for vim-gitgutter
set shell=/usr/local/bin/fish   " Fish as default shell
set undofile                    " This enables us to undo files even if you exit Vim.

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Change cursor shape in different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" TrueColor
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Remember last position in file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Colorscheme
syntax enable
let ayucolor="mirage"
try
  colorscheme ayu
  " colorscheme onehalfdark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

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
" theme
let g:airline_theme='ayu_mirage'

" edkolev/tmuxline.vim

" powerline separators
let g:tmuxline_powerline_separators=0
" custom preset
let g:tmuxline_preset={
    \ 'a'      : '#S',
    \ 'b'      : '',
    \ 'c'      : '',
    \ 'win'    : '#I',
    \ 'cwin'   : '#I \uF120',
    \ 'x'      : '',
    \ 'y'      : '#(dig +short myip.opendns.com @resolver3.opendns.com)',
    \ 'z'      : '\uF662  #(kubectl config current-context)',
    \ 'options': {'status-justify': 'left'}
    \ }

" Yggdroot/indentLine

let g:indentLine_enabled=1

" hashivim/vim-terraform

let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1

" fatih/vim-go

" Jump to next error with up and previous error with down arrow key.
" Close the quickfix window with <leader>a
nnoremap <down> :cnext<CR>
nnoremap <up> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_sameids = 1

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

" scrooloose/nerdtree

" open it
map <leader>m :NERDTreeToggle<CR>
" automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen=1
" show hidden files
let NERDTreeShowHidden=1
" delete buffer without confimation
let NERDTreeAutoDeleteBuffer=1
" open on the right side
let g:NERDTreeWinPos = "right"
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" mattn/emmet-vim

" redefine trigger key
let g:user_emmet_leader_key='<C-e>'

" mhinz/vim-startify

" show vim-devicons
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
" bookmark vim, tmux, fish configs
let g:startify_bookmarks = [
  \ {'c': '~/git/Private/dotfiles/vimrc'}
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

" CtrlP key binding
nmap <C-p> :Files<CR>
" Buffer key binding
nmap ; :Buffers<CR>
" default layout
" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'
" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)
  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.6)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }
  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction
" search with preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
