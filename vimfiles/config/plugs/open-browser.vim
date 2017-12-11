scriptencoding utf-8

if hs#plug#in('open-browser.vim')
  let g:netrw_nogx = 1
  let g:openbrowser_default_search = 'duckduckgo'
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)
endif
