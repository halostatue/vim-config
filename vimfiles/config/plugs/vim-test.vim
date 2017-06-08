scriptencoding utf-8

if hs#plug#in('vim-test')
  nmap <silent> [Space]tt :<C-U>TestNearest<Return>
  nmap <silent> [Space]tf :<C-U>TestFile<Return>
  nmap <silent> [Space]ta :<C-U>TestSuite<Return>
  nmap <silent> [Space]tl :<C-U>TestLast<Return>
  nmap <silent> [Space]tg :<C-U>TestVisit<Return>
endif
