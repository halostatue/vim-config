scriptencoding utf-8

if hs#plug#in('tabular')
  " Tabularization of equals signs
  nmap <Leader>a= :Tabularize eq<Return>
  xmap <Leader>a= :Tabularize eq<Return>

  " Tabularization of hashes as JSON.
  nmap <Leader>a: :Tabularize json_hash<Return>
  xmap <Leader>a: :Tabularize json_hash<Return>

  augroup hsautocmd-ruby-tabularize
    " Override Tabularization of hashes to Ruby hash formats.
    autocmd FileType ruby
          \ nmap <buffer> <Leader>a: :<C-U>Tabularize ruby_hash<Return> |
          \ xmap <buffer> <Leader>a: :<C-U>Tabularize ruby_hash<Return>
    autocmd FileType ruby
          \ nmap <buffer> <Leader>a> :<C-U>Tabularize ruby_rocket_hash<Return> |
          \ xmap <buffer> <Leader>a> :<C-U>Tabularize ruby_rocket_hash<Return>
  augroup END
endif
