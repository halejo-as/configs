set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set cursorline
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set smartindent
set tabstop=4 softtabstop=4
set expandtab
set foldmethod=syntax

call plug#begin('~/.vim/plugged')

"Temas
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" C++
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

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


