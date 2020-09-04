" Vim syntax file
" Language: xjmas
" Maintainer: Leon Schumacher
" Latest Revision: 07 March 2020

if exists("b:current_syntax")
  finish
endif

syn keyword todo contained TODO FIXME NOTE HACK
syn match comment "#.*$" contains=todo

syn match labelUse '[_a-zA-Z]\+'
syn match labelDef '[_a-zA-Z]\+\:'
syn match snum '[-+]\=\d\+'

syn keyword basicAsm umc take save add sub test jump inc dec null stop iomap nextgroup=snum skipwhite

let b:current_syntax = "xjmas"

hi def link todo Todo
hi def link comment Comment
hi def link basicAsm Statement
hi def link labelDef Preproc
hi def link labelUse Identifier
hi def link snum Constant
