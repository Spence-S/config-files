""""""""""""""""""""""""""
"// Spencer's Vim config //
""""""""""""""""""""""""""

" VIM PLUG
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" environment
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'                        "The vim look youve always wanted
" utilities
Plug 'tpope/vim-surround'                             "Cool stuff for quote I think lol 
Plug 'ctrlpvim/ctrlp.vim'                             "Fuzzy searcher
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

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

"CUSTOM MAPPINGS
let mapleader=','
"tab selections like a normal editor
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"remap arrow keys to change panes 
noremap <left> <esc>:brewind<cr>
noremap <right> <esc>:bnext<cr>
