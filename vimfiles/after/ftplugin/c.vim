if exists("b:did_after_c_ftplugin")
  finish
endif

let b:did_after_c_ftplugin=1

runtime macros/c-style.vim
