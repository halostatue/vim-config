if !exists(':Tabularize') || get(g:, 'no_default_tabular_maps', 0)
  finish " Tabular.vim wasn't loaded or the default maps are unwanted
endif

let s:save_cpo = &cpo
set cpo&vim

AddTabularPattern! eq /=
AddTabularPattern! json_hash /^[^:]*\zs:
AddTabularPattern! ruby_hash /^[^:]*:
AddTabularPattern! ruby_rocket_hash /=>

let &cpo = s:save_cpo
unlet s:save_cpo
