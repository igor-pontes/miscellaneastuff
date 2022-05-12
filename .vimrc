if &term =~ '^xterm'
  " normal mode
  let &t_EI .= "\<Esc>[1 q"
  " insert mode
  let &t_SI .= "\<Esc>[6 q"
endif
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
let g:NERDTreeNodeDelimiter = "\u00a0"
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'theniceboy/vim-calc'
Plugin 'wadackel/vim-dogrun'
Plugin 'cocopon/iceberg.vim'
Plugin 'tmsvg/pear-tree'
Plugin 'valloric/youcompleteme'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:ycm_key_list_stop_completion = ['<C-Space>']
let g:ycm_autoclose_preview_window_after_completion = 1
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
let g:airline_theme='zenburn'
let g:NERDTreeWinSize=20

call vundle#end()            " required

set background=dark

set autochdir
function Find()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    let pattern = join(lines, "\n")
    let cmd = 'grep -rnw ./ -e '.pattern
    execute "let output = system(cmd)"
    tabnew 
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    call setline(1, split(output, "\n"))
endfunction

filetype plugin indent on    " required
" dogrun, iceberg
colorscheme iceberg

set termguicolors
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
"set autoindent
"set noesckeys
set nocompatible
set smartindent
set number
set ttimeoutlen=5
syntax on
autocmd FileType vim let b:vcm_tab_complete = 'vim'
nnoremap <C-Up> :bnext!<CR>
noremap <A-Up> ddkP
noremap <A-Down> ddp
nnoremap <C-Down> :bprev!<CR>
nnoremap <S-Down> <C-e>
nnoremap <S-Up> <C-y>
nnoremap cd :bp\|bd! #<CR>
nnoremap <LEADER>a :call Calc()<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

