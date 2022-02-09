set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
let g:NERDTreeNodeDelimiter = "\u00a0"
Plugin 'scrooloose/syntastic'
Plugin 'theniceboy/vim-calc'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='minimalist'
" Plugin 'ulwlu/elly.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" elly, phoenix
colorscheme phoenix 
set termguicolors
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smartindent
set number
syntax on
nnoremap <C-Up> :bnext!<CR>
nnoremap <C-Down> :bprev!<CR>
nnoremap cd :bp\|bd! #<CR>
nnoremap <LEADER>a :call Calc()<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

