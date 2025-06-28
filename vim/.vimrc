call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
call plug#end()

let mapleader = "ff"
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>


" set airline theme
let g:airline_theme = 'minimalist'
let laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

set termguicolors

" Theme
syntax enable
" colorscheme tender
set background=dark
let g:gruvbox_material_background = 'hard'   " or 'hard', 'soft'
colorscheme gruvbox-material
let g:gruvbox_material_disable_italic_comment = 1

highlight ColorColumn ctermbg=0 guibg=#2a2a2a


set noshowmode

set mouse=a
set clipboard=unnamedplus
set hlsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix
set encoding=utf-8
set ts=2
set sw=2
set si
set is
set hls

" fix cursor
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
inoremap kj <Esc>


" Basic coc config
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
" autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

" editing? relative nu, not editing? nu
set nu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END


" cpp code using g++
autocmd FileType cpp nnoremap <f9> :w<CR>:!g++ % -o %< && ./%<<CR>
autocmd FileType cpp nnoremap <f8> :w<CR>:!gcc % -o %< && ./%<<CR>
