# This file installs everything I need for vim to work

# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Solarized
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

# NerdTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# NerdTree git plugin
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin

# Syntastic
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

# Tagbar
git clone https://github.com/majutsushi/tagbar ~/.vim/bundle/tagbar

# CtrlP

# fugitive.vim
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
vim -u NONE -c "helptags vim-fugitive/doc" -c q

# surround.vim
git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround

# YouCompleteMe
git clone https://github.com/valloric/youcompleteme ~/.vim/bundle/youcompleteme

# Tabular
git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
