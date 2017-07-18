scriptencoding utf-8

if hs#plug#in('editorconfig-vim')
  let g:EditorConfig_exclude_patterns = [ 'fugitive://.*' ]
endif
