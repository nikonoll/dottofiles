set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'tComment'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'jparise/vim-graphql'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'MarcWeber/vim-addon-mw-utils'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" general vim options
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
set t_Co=256
syntax on
cabbr te tabedit
set expandtab
set nocompatible
set shiftwidth=2
set showtabline=2
set cursorline
set relativenumber
set number
set numberwidth=5
set wrap
set backspace=0
set t_Co=256
set autoread " make vim reload if files changed
set omnifunc=syntaxcomplete#Complete

" buffer shortcuts
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>q :bd<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Make splitting Vim windows easier
map <leader>s <C-W>s
map <leader>v <C-W>v
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" }}}

" search / tags
set wildmenu
set showmatch
set incsearch
set hlsearch
set autochdir
set tags=./.git/tags;
nnoremap gV `[v`]
nnoremap <leader>. :CtrlPTag<cr>
set signcolumn=yes

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" TODO: check how to open found line and file directly
" Allows to fuzzy search the ctags file with :Tags, amazingly fast
command! -bar Tags if !empty(tagfiles()) | call fzf#run({
      \   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
      \   'sink':   'tag',
      \ }) | else | echo 'Preparing tags' | call system('ctags -R') | FZFTag | endif

" theme / looks
set background=light
colorscheme PaperColor
" highlight ALEWarning ctermbg=Magenta
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
" let g:airline_theme='dracula'
let g:airline_theme='papercolor'

" language specific highlighting
let python_highlight_all = 1

" ale settings
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" ctrl p buffer navigation
map <Leader>b :CtrlPBuffer<CR>
map <Leader>p :CtrlP<CR>

" experimental
" hi vertsplit ctermfg=238 ctermbg=235
" hi LineNr ctermfg=237
" hi StatusLine ctermfg=235 ctermbg=245
" hi StatusLineNC ctermfg=235 ctermbg=237
" hi Search ctermbg=58 ctermfg=15
" hi Default ctermfg=1
" hi clear SignColumn
" hi SignColumn ctermbg=237
" hi GitGutterAdd ctermbg=235 ctermfg=245
" hi GitGutterChange ctermbg=235 ctermfg=245
" hi GitGutterDelete ctermbg=235 ctermfg=245
" hi GitGutterChangeDelete ctermbg=235 ctermfg=245
" hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode
