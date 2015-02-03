if exists("b:did_after_cpp_ftplugin")
  finish
endif

let b:did_after_cpp_ftplugin=1

runtime macros/c-style.vim
