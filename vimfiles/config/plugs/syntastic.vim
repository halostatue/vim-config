scriptencoding utf-8

if hs#plug#in('syntastic')
  " Syntastic
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0
  let g:syntastic_enable_signs=1
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_ruby_mri_exec = expand('~/.rubies/ruby-2.2.2/bin/ruby')
  let g:syntastic_ruby_rubocop_exe = g:syntastic_ruby_mri_exec . ' -S rubocop'
  " let g:syntastic_ruby_rubylint_exe = g:syntastic_ruby_mri_exec . ' -S ruby-lint'
  let g:syntastic_ruby_checkers = [ 'mri', 'rubocop' ]
  let g:syntastic_javascript_checkers = [ 'eslint' ]
  " let g:syntastic_javascript_eslint_exec = 'eslint_d'
  let g:syntastic_vim_checkers = ['vint']
endif
