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

set background=light

let colors_name = "default"

" vim: sw=2

" SpellingErrors
hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare

hi SpellBad     term=reverse ctermfg=green gui=undercurl guisp=grey
hi SpellCap     term=reverse ctermfg=green gui=undercurl guisp=grey
hi SpellLocal   term=reverse ctermfg=green gui=undercurl guisp=grey
hi SpellRare    term=reverse ctermfg=green gui=undercurl guisp=grey
