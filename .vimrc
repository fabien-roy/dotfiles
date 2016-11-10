set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'valloric/youcompleteme'
Plugin 'godlygeek/tabular'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

syntax on
filetype plugin indent on

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab
set number ic hls is cursorline
set nocp

" Nerdtree
autocmd vimenter * NERDTree
map <C-n>: :NERDTreeToggle<CR>

" Nerdtree git plugin
let g:NERDTreeIndicatorMapCustom = {
 \   "Modified"  : "m",
 \   "Staged"    : "+",
 \   "Untracked" : "*",
 \   "Renamed"   : ">",
 \   "Unmerged"  : "=",
 \   "Deleted"   : "x",
 \   "Dirty"     : "X",
 \   "Clean"     : "o",
 \   "Unknown"   : "?"
 \  }

" NERDcommenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERTrimTrailingWhitespace = 1

set laststatus=2
set t_Co=256

" ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" closetag.vim
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Solarized
syntax enable
set background=dark
colorscheme solarized

" Tagbar
nmap <F8> :TagbarToggle<CR>

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O>

hi Normal ctermbg=none
