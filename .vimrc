set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ervandew/supertab'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'xoria256.vim'
Plugin 'ctrlp.vim'
Plugin 'ZoomWin'
Plugin 'Syntastic'
Plugin 'matchit.zip'
Plugin 'tComment'
Plugin 'tristen/vim-sparkup'
Plugin 'altercation/vim-colors-solarized'
Plugin 'plasticboy/vim-markdown'
Plugin 'toyamarinyon/vim-swift'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" vim options
set t_Co=256
filetype plugin indent on
syntax on
cabbr te tabedit
colorscheme xoria256
" colorscheme solarized
"set background=dark
set expandtab
set nocompatible
set tabstop=2
set shiftwidth=2
set showtabline=2
set number
set wrap
set backspace=0
set t_Co=256
" set colorcolumn=+1 " red line and over is error
" set textwidth=80
set hlsearch

" set NERDTREE
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
set spell spelllang=en_us

" turn off vim-markdown folding
let g:vim_markdown_folding_disabled=1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
