scriptencoding utf-8

if hs#plug#in('foldCC.vim')
  let g:default_foldtext_function = 'FoldCCtext'
endif

if hs#plug#in('vim-foldround')
  nmap [Space]ff <Plug>(foldround-forward)
  nmap [Space]fb <Plug>(foldround-backward)
endif
