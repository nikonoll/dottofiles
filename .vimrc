" Vundle Plugins {{{


set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlp.vim'
Plugin 'Syntastic'
Plugin 'tComment'
Plugin 'mattn/emmet-vim'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'hdima/python-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" general vim options {{{
" -------------
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
set t_Co=256
syntax on
cabbr te tabedit
set expandtab
set nocompatible
set tabstop=2
set shiftwidth=2
set showtabline=2
set cursorline
set relativenumber
set wrap
set backspace=0
set t_Co=256
set autoread " make vim reload if files changed
set omnifunc=syntaxcomplete#Complete
call togglebg#map("<F7>") " toggle background color
" buffer shortcuts
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <Leader>j :bnext<CR>
nnoremap <Leader>k :bprevious<CR>
" }}}

" folding options {{{
" -------------
set foldenable
set foldlevelstart=10 "open most folds by default
set foldnestmax=10
set foldmethod=indent
" comma opens and closes folds
nnoremap "," za
" }}}

" search / tags {{{
" -------------
set wildmenu
set showmatch
set incsearch
set hlsearch
set autochdir
set tags=./tags;
nnoremap gV `[v`]

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif 

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}

"  sessions {{{
" -------------
nnoremap <leader>s :mksession<CR>
" }}}

" theme / looks {{{
" -------------
set background=light
colorscheme solarized
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" }}}

" language specific highlighting {{{
" -------------
let python_highlight_all = 1

" }}}

" plugin settings {{{
" set NERDTREE
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=zend -n --report=csv"
" set spell spelllang=en_us
map <Leader>l :SyntasticCheck<CR>

" ctrl p buffer navigation
map <Leader>b :CtrlPBuffer<CR>
map <Leader>p :CtrlP<CR>

" turn off vim-markdown folding
let g:vim_markdown_folding_disabled=1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" }}}


