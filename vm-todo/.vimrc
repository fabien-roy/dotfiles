execute pathogen#infect()

set number
syntax on
filetype plugin indent on

" Powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
set laststatus=2
" set t_Co=256

" NERDTree
autocmd VimEnter * NERDTree

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" fugitive.vim
autocmd QuickFixCmdPost *grep* cwindow

" ctrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Oh my zsh
