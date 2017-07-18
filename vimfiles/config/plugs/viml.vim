scriptencoding utf-8

if hs#plug#in('exception.vim')
  command! WTF call exception#trace()
endif
