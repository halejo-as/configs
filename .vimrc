set number
set mouse=a
set numberwidth=1
"set clipboard+=unnamedplus
"copy with clipboard doest work with \"*y or \"+y
"USE SHIFT+CTL and SHIFT+CTL+C
syntax enable
set showcmd
set cursorline
"set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set smartindent
set tabstop=4 softtabstop=4
set expandtab
set foldmethod=syntax

set list
set listchars=tab:>-
" Allows have .vimrc to different projects
set exrc

" Refresh file when change branch 
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
set autoread
call plug#begin('~/.vim/plugged')

"Temas
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" C++
Plug 'neoclide/coc.nvim' ", {'branch': 'release'}
" Git
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

call plug#end()

let g:airline#extensions#branch#enabled = 1

" Config Temas
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
"let NERDTreeQuitOnOpen=1

" COC TAB
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


"Maps
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>h :noh<CR>

"Fast compile C++ files
nmap <F9> :w<CR> :!g++ % -o /tmp/%< && /tmp/%< <CR>

" prevent :autocmd
set secure
