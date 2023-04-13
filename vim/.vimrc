nnoremap <Space> <nop>
let mapleader =" "

" remap K to <leader>i
nnoremap <leader>i K
nmap K <nop>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" netrw explorer
nnoremap <C-S-e> :Ex<CR>

" move selected block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" append to current line
nnoremap J mzJ`z

" fast movement
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" keep search result in middle of screen
nnoremap n nzzzv
nnoremap N Nzzzv

" paste over current word
xnoremap <leader>p "_dP

" delete to void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" quickfix navigtion
nnoremap <C-k> <cmd>cnext<CR>zz
nnoremap <C-j> <cmd>cprev<CR>zz
nnoremap <leader>k <cmd>lnext<CR>zz
nnoremap <leader>j <cmd>lprev<CR>zz

" yank text in reg 6
vnoremap "" "6y
" replace current word with text from reg 6
nnoremap cp de"6P
" replace from current pos to end of the line with text from reg 6
nnoremap [] d$"6P

" yank text in reg 0
vnoremap 00 "0y
" paste from 0
nnoremap 00 "0P

inoremap kk <Esc>
inoremap jj <Esc><CR>
inoremap lll <Esc>l
inoremap hhh <Esc>h

" remap <Tab> to <C-p> as with LSP <Tab> doesn't seem to work
nnoremap <C-p> <Tab>

nnoremap <leader>c :nohl<CR>
nnoremap <leader><CR> i<CR><Esc>
nnoremap <leader>j o<Esc>j
" insert 4 spaces (tab)
nnoremap <leader><Tab> i<Tab><ESC>l

" start and end of the line
nnoremap <leader>s 0
nnoremap <leader>e $

" yank into clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p

nnoremap qq :q<CR>
nnoremap qa :qa<CR>
nnoremap sa :wqa<CR>
nnoremap sx :wq<CR>
nnoremap sw :w<CR>
nnoremap qb :bd<CR>
" quit all buffers except current along with empty buffer
nnoremap qx :%bd\|e#\|bd#<CR>
nnoremap 55 q5
nnoremap ,, @5
nnoremap , @@

nnoremap d[ ci[
nnoremap d{ ci{
nnoremap d( ci(

nnoremap zz :set foldenable<CR>
nnoremap zn :set nofoldenable<CR>

" set current file as executable
nnoremap <leader>x :!chmod +x %<CR>

" map capital versions for ease
command W w
command Q q

set number
set relativenumber
set expandtab
set hlsearch
set showcmd
set smartindent
set timeoutlen=1500
set encoding=utf-8
set showtabline=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set colorcolumn=80
set scrolloff=8
