""""""""""""""""""""""""""
"//                      //
"// Spencer's Vim config //
"//                      //
""""""""""""""""""""""""""





"------------------------
" VUNDLE ----------------
"------------------------
set nocompatible "use vim, not vi
filetype off  " not sure, but required lol 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" PLUGIN LIST -----------
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'                             "git wrapper
Plugin 'scrooloose/syntastic'                           "linting and other good stuff
Plugin 'ctrlpvim/ctrlp.vim'                             "Fuzzy searcher
Plugin 'scrooloose/nerdtree'                            "The TREE VIEW YESSS
Plugin 'vim-airline/vim-airline'                        "The vim look youve always wanted
Plugin 'vim-airline/vim-airline-themes'                 "themes for airline
Plugin 'tpope/vim-surround'                             "Cool stuff for quote I think lol 
Plugin 'pangloss/vim-javascript'                        "JS highlighting plugin 
Plugin 'yggdroot/indentline'                            "show indentions with lines 
Plugin 'ryanoasis/vim-devicons'                         "some sweetass icon shit
Plugin 'Townk/vim-autoclose'                            "auto close brackets


" VUNDLE Command Cheat Sheet
" :PluginList       - lists configured plugins   
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

call vundle#end()            " required
filetype plugin indent on    " required
 




  
"------------------------
" CUSTOM CONFIGURATIONS
" -----------------------
set number                          "show line #
set autoindent                      "obvious
set smartindent
set nowrap                          "dont wrap your lines like a punkass bitch
syntax enable                       "turn on syntax highlighting yay
set backspace=indent,eol,start      "Make backspace behave like normal
set splitright                      "more natural pane splitting
set splitbelow
set showcmd                         "show incomplete commands 
set expandtab                       "convert tabs to spaces
set tabstop=4                       "set tab size
set softtabstop=4                   "soft tab stop 
set shiftwidth=4                    "the number of spaces inserted for a tab
set hidden                          "act like other editors https://github.com/skwp/dotfiles/blob/master/vimrc
set wildmenu                        "Enhanced command completion with bar
set nobackup                        "no backup files
set nowritebackup                   "only in case you don't want a backup file while editing
set noswapfile                      "no swap files
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


"------------------------
"NERDTREE CONFIG
"------------------------
"always show NERDTree
autocmd BufWinEnter * NERDTreeMirror
let NERDTreeShowHidden = 1 "show hidden files in NerdTree by default
set mouse=a "enable mouse use
let NERDTreeMouseMode = 2 "enable nerdtree mouse clicks to open files
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "close if NERDTree is all thats open

" NERDTress File highlighting (by ryanoasis https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696) 
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('pug', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"NerdTree Toggle Key Map
map <C-n> :NERDTreeToggle<CR>


"------------------------
" DEVICON CONFIG
"------------------------
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1





"------------------------
"Airline settings
"------------------------
set laststatus=2 "Always show airline bar
let g:airline_theme='molokai' "set the airline theme
let g:airline_powerline_fonts = 1


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'











"------------------------
"Syntastic settings
"------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 2

let g:syntastic_javascript_checkers = ['eslint'] "add eslint to the config








"------------------------
"CUSTOM MAPPINGS
"------------------------
let mapleader=' '
nnoremap <leader>s :w<cr> 
nnoremap <leader>c :q<cr> 
nnoremap <leader>q :wq<cr> 
nnoremap <leader>r :source $MYVIMRC<cr>

"tab selections like a normal editor
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"remap arrow keys to change panes 
noremap <left> <esc>:brewind<cr>
noremap <right> <esc>:bnext<cr>
