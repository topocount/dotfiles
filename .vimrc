" disable nocompatible for neovim
if !has('nvim')
    set nocompatible
endif
filetype off
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let g:CommandTPreferredImplementation='ruby'
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
Plug 'neovim/nvim-lspconfig'
Plug 'plasticboy/vim-markdown'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'yuezk/vim-js'
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'dense-analysis/ale'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'solidity'] }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'tfnico/vim-gradle'
Plug 'wincent/command-t', {
      \ 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make',
      \ }
      " for the new non-ruby mode
      "\ 'do': 'cd lua/wincent/commandt/lib/ && make'
      "\ }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
" Plug 'ocaml/vim-ocaml'
Plug 'tomlion/vim-solidity'
Plug 'ryanoasis/vim-devicons'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
endif
" All Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

"Disable error message output for autocomplete lookups
set shortmess+=c

" Tabs
set tabstop=2
set shiftwidth=2 shiftround
set expandtab
set cindent

" code folding
set foldenable
set foldmethod=indent

" Windows
set splitright " new vsplits open on right

" console options
set noshowmode

" Line numbering
set number

" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" airline: remove branch name form bar
let g:airline#extensions#branch#enabled = 0
" fonts for vim-airline
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = ' '
" let g:airline_symbols.branch = ''
let g:airline_symbols.branch = ''
" let g:airline_symbols.linenr = ' ¶:'

" Line number coloring
set cursorline
if !has('nvim')
  set cursorlineopt=number
endif
highlight LineNr cterm=bold ctermfg=DarkGray
highlight CursorLineNr cterm=bold ctermfg=Blue

" Ruler
set colorcolumn=80
" formerly the ruler was lightblue
highlight ColorColumn ctermbg=DarkGray
" Enable mouse selection
set mouse=a

" link to system clipboard
" set clipboard^=unnamed,unnamedplus

" shortcuts for the system clipboard
noremap <C-p> <ESC>"+pa
vnoremap <C-y> "+y

" set shell to zsh
set shell=/bin/zsh

" auto-copy visual selections
set go+=a

" Markdown Syntax concealing
set conceallevel=2

" markdown config
" markdown indentation
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_strikethrough = 0

" gitgutter options
highlight GitGutterAdd    guifg=#009900 ctermbg=2
highlight GitGutterChange guifg=#bbbb00 ctermbg=3
highlight GitGutterDelete guifg=#ff2222 ctermbg=1

" ALE options
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" OCAML merlin ALE integration
if executable('opam')
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  if isdirectory(g:opamshare."/merlin/vim")
     execute "set rtp+=" . g:opamshare . "/merlin/vim"
  endif
endif

" Diff coloring
highlight diffAdded ctermfg=green
highlight diffRemoved ctermfg=red

" darkmode syntax highlighting for vanilla vim
" if !has('nvim')
  highlight Visual ctermfg=Black
  highlight Search ctermfg=Black

  highlight SpellBad ctermbg=DarkRed ctermfg=White
  highlight SpellCap ctermfg=Black
  highlight SpellRare ctermfg=Black
  highlight SpellLocal ctermfg=Black

  highlight DiffAdd ctermfg=Black
  highlight DiffChange ctermfg=Black
" endif

if has('nvim')
" neovim terminal exit shortcuts
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-w> <C-\><C-n><C-w>
" neovim terminal buffer shortcut
  command Term :execute "vsplit | term"
endif


" optimize file searching within vim by ignoring node_modules and docs
" Searching node_modules can be done by modifying this variable on the fly
set wildignore+=*/node_modules/*
set wildignore+=*/docs/*

" command-t dismissal
let g:CommandTCancelMap='<Esc>'

" enable link following
let g:netrw_browsex_viewer= "xdg-open"

" alias for definition lookups
let g:ale_hover_to_preview = 1
command Agd ALEGoToDefinition -split
command Ag ALEGoToDefinition
command Ah ALEHover

" Rust config


" NERDTree shortcuts
command NT NERDTreeToggle

" cursor modes
" i beam for insert mode
let &t_SI = "\<Esc>[6 q"
" underline for replace mode
let &t_SR = "\<Esc>[4 q"
" block for normal mode
let &t_EI = "\<Esc>[2 q"
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
"   execute 'set rtp^=' . s:opam_share_dir . '/ocp-indent/vim'
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
"   execute 'set rtp+=' . s:opam_share_dir . '/ocp-index/vim'
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . '/merlin/vim'
"   execute 'set rtp+=' . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')

" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 61cd7a77c9263e615055550a867057a7 ## you can edit, but keep this line
" if count(s:opam_available_tools,"ocp-indent") == 0
"   source "/home/kevin/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
" endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

" Use legacy ruby in Command-T
let g:CommandTPreferredImplementation='ruby'

" remove octal formatting from vim
" default config in nvim and vim 8.0
" set nrformats-=octal
