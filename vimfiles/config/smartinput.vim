scriptencoding utf-8

if hs#plug#in('vim-smartinput')
  call smartinput#define_rule({
        \   'at': '\%#',
        \   'char': '''',
        \   'input': '''''<Left>',
        \   'filetype': ['rust'],
        \   'syntax': ['Special']
        \ })

  call smartinput#map_to_trigger('i', '#', '#', '#')
  call smartinput#define_rule({
        \   'at': '\%#',
        \   'char': '#',
        \   'input': '#{}<Left>',
        \   'filetype': ['ruby'],
        \   'syntax': ['Constant', 'Special']
        \ })

  call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
  call smartinput#define_rule({
        \   'at': '\({\|\<do\>\)\s*\%#',
        \   'char': '<Bar>',
        \   'input': '<Bar><Bar><Left>',
        \   'filetype': ['ruby']
        \ })
endif
