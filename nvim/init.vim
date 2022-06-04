" enable line-numbers
set number
" set indent usint Tab to 4 spaces
set expandtab
set tabstop=4
set softtabstop=-1
set shiftwidth=0

" highlight search items
set hlsearch

" create backup of file before overwrite
set backup

" show command 
set showcmd

" set filetype plugin and indentation on
filetype plugin indent on

" vim-plug
call plug#begin()
    " The default plugin directory will be as follows:
    "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
    " Make sure you use single quotes

    " easily align configs and stuff
    Plug 'junegunn/vim-easy-align'

    " NerdTree file explorer
    Plug 'preservim/nerdtree'

    " Using a non-default branch
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

    " Plugin fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " json highlighting
    Plug 'elzr/vim-json'

    " add comments
    Plug 'preservim/nerdcommenter'

    " theme
    Plug 'sainnhe/everforest'
    Plug 'sainnhe/sonokai'

    " view colors from hex and rgb codes
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    
    " status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='sonokai'
" set encoding
set encoding=utf-8

" colorscheme config
if has('termguicolors')
    set termguicolors
endif

" colorscheme 
set background=dark
" syntax
syntax enable
" colorscheme specifics
let g:everforest_background = 'hard'
let g:sonokai_style = 'default'
" For better performance
let g:everforest_better_performance = 1
let g:sonokai_better_performance = 1
colorscheme sonokai
" update line numbers
highlight LineNr guifg=bg guibg=darkgrey

" keymappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
