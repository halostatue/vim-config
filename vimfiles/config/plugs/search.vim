scriptencoding utf-8

if hs#plug#in('is.vim')
  if hs#plug#in('vim-anzu')
    map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
    map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
    nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
  endif

  if hs#plug#in('vim-asterisk')
    map * <Plug>(asterisk-z*)<Plug>(is-nohl-1)<Plug>(anzu-star-with-echo)
    map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)<Plug>(anzu-star-with-echo)
    map # <Plug>(asterisk-z#)<Plug>(is-nohl-1)<Plug>(anzu-sharp-with-echo)
    map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)<Plug>(anzu-sharp-with-echo)
  endif
endif
