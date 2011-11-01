if exists("b:did_after_objc_ftplugin")
  finish
endif

let b:did_after_objc_ftplugin=1

runtime macros/c-style.vim

" OmniCppComplete initialization
" call omni#cpp#complete#Init()
