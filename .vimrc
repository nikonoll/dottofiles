" Vundle Pugins {{{
set nocompatible              " be iMproved, required
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
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
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'tComment'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/loremipsum'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-markdown'
Plugin 'vimwiki/vimwiki'
Plugin 'suan/vim-instant-markdown'

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
set tabstop=2
set shiftwidth=2
set showtabline=2
set cursorline
set relativenumber
set numberwidth=5
set wrap
set backspace=0
set t_Co=256
set autoread " make vim reload if files changed
set omnifunc=syntaxcomplete#Complete
call togglebg#map("<F9>") " toggle background color

" buffer shortcuts
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <Leader>j :bnext<CR>
nnoremap <Leader>k :bprevious<CR>
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

" folding options
set foldenable
set foldlevelstart=10 "open most folds by default
set foldnestmax=10
set foldmethod=indent
" comma opens and closes folds
nnoremap "," za

" search / tags
set wildmenu
set showmatch
set incsearch
set hlsearch
set autochdir
set tags=./tags;
nnoremap gV `[v`]
nnoremap <leader>. :CtrlPTag<cr>

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
colorscheme solarized
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" language specific highlighting
let python_highlight_all = 1

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" ctrl p buffer navigation
map <Leader>b :CtrlPBuffer<CR>
map <Leader>p :CtrlP<CR>

" reading mode / note taking / markdown
"
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax

" vim-instant-markdown - Instant Markdown previews from Vim
let g:instant_markdown_autostart = 0
map <leader>md :InstantMarkdownPreview<CR>
