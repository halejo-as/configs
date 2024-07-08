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
set colorcolumn=99

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
Plug 'neoclide/coc.nvim' , {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn i'}
" Git
Plug 'tpope/vim-fugitive'
" Plug 'vim-airline/vim-airline'

"Python 
Plug 'https://github.com/nvie/vim-flake8.git'

call plug#end()


" Config Temas
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
"let NERDTreeQuitOnOpen=1

" COC TAB
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(0) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
let &path = substitute($PYTHONPATH, ':', ',', 'g')
let &path = &path . "," . substitute($AMENT_PREFIX_PATH, ':', ',', 'g')

