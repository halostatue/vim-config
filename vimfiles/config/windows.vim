" Why Windows still uses drive letters in 2015, I have no clue.
set viminfo+=rA:,rB:

" In Windows, can't find exe, when $PATH doesn't contained $VIM.
if $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

" Disable error messages when using csapprox.
let g:CSApprox_verbose_level = 0
