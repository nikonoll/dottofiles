" Vundle Plugins {{{

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'ctrlp.vim'
Plugin 'Syntastic'
Plugin 'tComment'
Plugin 'mattn/emmet-vim'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'hdima/python-syntax'
Plugin 'jnurmine/Zenburn'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" general vim options {{{
" -------------
let mapleader=" "
set t_Co=256
filetype plugin indent on
syntax on
cabbr te tabedit
set expandtab
set nocompatible
set tabstop=2
set shiftwidth=2
set showtabline=2
set cursorline
set number
set wrap
set backspace=0
set t_Co=256
set autoread " make vim reload if files changed
set omnifunc=syntaxcomplete#Complete
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
" }}}

"  sessions {{{
" -------------
nnoremap <leader>s :mksession<CR>
" }}}

" theme / looks {{{
" -------------
colorscheme zenburn
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

" undo with gundo
#!vimscript
if has('python3')
  let g:gundo_prefer_python3 = 1
endif "
noremap <leader>u :GundoToggle<CR>

"settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 2
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=zend -n --report=csv"
set spell spelllang=en_us

" turn off vim-markdown folding
let g:vim_markdown_folding_disabled=1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" }}}
"
" vim:foldmethod=marker:foldlevel=0
