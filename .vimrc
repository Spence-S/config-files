""""""""""""""""""""""""""
"// Spencer's Vim config //
""""""""""""""""""""""""""

" VIM PLUG
""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')
" environment
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'pangloss/vim-javascript'
Plug 'xojs/vim-xo'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" utilities
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

" ALE
let b:ale_fixers = {'javascript': ['xo'], "json": ['prettier']}
let b:ale_linters = {'javascript': ['xo']}
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

"NERDTREE CONFIG
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" DEVICON CONFIG
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

"Airline settings
let g:airline#extensions#tabline#enabled = 1 "enable the plugin
set laststatus=2 "Always show airline bar
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

"CUSTOM OPTIONS 
"""""""""""""""""""""""""""
let g:prettier#autoformat = 0
set clipboard+=unnamedplus
set number
" turn off all bells
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" change cursor for different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"CUSTOM MAPPINGS
let mapleader=','
"tab selections like a normal editor
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
"remap arrow keys to change panes 
noremap <left> <esc>:brewind<cr>
noremap <right> <esc>:bnext<cr>
