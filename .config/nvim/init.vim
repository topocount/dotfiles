set runtimepath^=/home/kevin/.vim runtimepath+=/home/kevin/.vim/after
let &packpath = &runtimepath
lua require('usermod.plugins')

source /home/kevin/.vimrc

