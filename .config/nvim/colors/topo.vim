" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "topo"

highlight LineNr cterm=bold ctermfg=DarkGray
highlight CursorLineNr cterm=bold ctermfg=Blue
highlight CursorLine ctermbg=236 cterm=NONe
highlight ColorColumn ctermbg=DarkGray
highlight GitGutterAdd    guifg=#009900 ctermbg=DarkGreen
highlight GitGutterChange guifg=#bbbb00 ctermbg=DarkYellow
highlight GitGutterDelete guifg=#ff2222 ctermbg=DarkRed
highlight NormalFloat ctermbg=DarkBlue
highlight Pmenu ctermbg=DarkBlue ctermfg=White
highlight PmenuKind ctermbg=DarkBlue ctermfg=White
highlight PmenuExtra ctermbg=DarkBlue ctermfg=White
highlight diffAdded ctermfg=green
highlight diffRemoved ctermfg=red
highlight Visual ctermfg=Black
highlight Search ctermfg=Black
highlight SpellBad ctermbg=DarkRed ctermfg=White
highlight SpellCap ctermfg=Black
highlight SpellRare ctermfg=Black
highlight SpellLocal ctermfg=Black
highlight DiffAdd ctermfg=Black
highlight DiffChange ctermfg=Black

" vim: sw=2
