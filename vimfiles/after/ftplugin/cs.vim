if exists("b:did_after_cs_ftplugin")
  finish
endif

let b:did_after_cs_ftplugin=1

runtime macros/c-style.vim

setlocal ts=2 sts=2 sw=2

setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,b:///,b://
