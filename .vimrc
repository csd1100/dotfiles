nnoremap <Space> <nop>
let mapleader =" "

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

vnoremap <C-S-y> "+y
nnoremap <C-p> "+p
" yank text in reg 6
vnoremap "" "6y
" replace current word with text from reg 6
nnoremap cp de"6P
" replace from current pos to end of the line with text from reg 6
nnoremap [] d$"6P

inoremap kk <Esc>
inoremap jj <Esc><CR>
inoremap lll <Esc>l
inoremap hhh <Esc>h

nnoremap <leader>c :nohl<CR>
nnoremap <leader><CR> i<CR><Esc>
nnoremap <leader>j o<Esc>j

nnoremap :W :w<CR>
nnoremap :Q :q<CR>
nnoremap qq :q<CR>
nnoremap qa :qa<CR>
nnoremap zz :wqa<CR>
nnoremap sx :wq<CR>
nnoremap sw :w<CR>
nnoremap qb :bd<CR>
" quit all buffers except current along with empty buffer
nnoremap qx :%bd\|e#\|bd#<CR>
nnoremap 55 q5
nnoremap ,, @5
nnoremap , @@

nnoremap <S-s> 15j
nnoremap <S-w> 15k
vnoremap <S-s> 10j
vnoremap <S-w> 10k

set number
set relativenumber
set expandtab
set hlsearch
set showcmd
set timeoutlen=1500
set encoding=utf-8
set showtabline=2
set tabstop=4
set softtabstop=-1
set shiftwidth=0
