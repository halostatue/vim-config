if !exists(':Tabularize') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

AddTabularPattern! eq /=
AddTabularPattern! json_hash /^[^:]*\zs:
AddTabularPattern! ruby_hash /^[^:]*:
AddTabularPattern! ruby_rocket_hash /=>

let &cpo = s:save_cpo
unlet s:save_cpo
