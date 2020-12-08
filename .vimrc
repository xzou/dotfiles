set nocompatible
filetype off

" ============================== Vundle ===============================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Raimondi/delimitMate'
Plugin 'RRethy/vim-hexokinase'
Plugin 'Yggdroot/indentLine'
Plugin 'alvan/vim-closetag'
Plugin 'easymotion/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'kana/vim-arpeggio'
Plugin 'kien/ctrlp.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

" Color schemes
Plugin 'sickill/vim-monokai'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ========================= General Settings ==========================

" Encoding
set encoding=utf-8


" Colors and formatting
colo wombat 
syntax on
set guifont=Monaco:h13

if has("gui_running")
  set lines=180
  set columns=250
endif


" Terminal colors
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
if !has("gui_running")
    colo monokai
endif


" Line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END


" Prevent beeping sound when error occurs
set visualbell


" Spacing
set linebreak
set textwidth=0
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround


" Indentation
set autoindent


" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch


" Mappings
let mapleader=","
let maplocalleader = "-"
nnoremap <leader><F5> :NERDTreeToggle<CR>
nnoremap <leader><space> viw
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-w> <C-w>w
nnoremap <leader>sq :set cole=0<cr>


" Custom commands
command! Json %!python -m json.tool
command! Gdt cd ~/Desktop


" ============================== PLUGINS ==============================


" ----------------------------- Arpeggio ------------------------------

" arpeggio#map({modes}, {options}, {remap-p}, {lhs}, {rhs})
call arpeggio#map('n', '', 0, '<C-l>', 'gt')
call arpeggio#map('n', '', 0, '<C-h>', 'gT')
call arpeggio#map('i', '', 0, '<C-l>', '<ESC>gt')
call arpeggio#map('i', '', 0, '<C-h>', '<ESC>gT')


" ------------------------------ CtrlP --------------------------------

" Set no max file limit
let g:ctrlp_max_files = 0

" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

set wildignore+=*/node_modules/**


" ---------------------------- Hexokinase -----------------------------
set h 'termguicolors'
let g:Hexokinase_highlighters = ['foreground']
let g:Hexokinase_ftEnabled = ['css', 'scss', 'html', 'javascript', 'soy']


" ======================== ADDITIONAL SCRIPTS =========================

if filereadable(expand("~/.dotfiles/.vimrc_local"))
    source ~/.dotfiles/.vimrc_local
endif
