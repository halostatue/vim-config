scriptencoding utf-8

if hs#plug#in('vim-unified-diff')
  set diffexpr=unified_diff#diffexpr()
endif
