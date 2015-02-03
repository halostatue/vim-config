if !exists(':Tabularize') | finish | endif

AddTabularPattern! eq /=
AddTabularPattern! json_hash /^[^:]*\zs:
AddTabularPattern! ruby_hash /^[^:]*:
AddTabularPattern! ruby_rocket_hash /=>
