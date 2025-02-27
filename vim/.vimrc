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

" to remove the highlighting you can do ':noh'
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
