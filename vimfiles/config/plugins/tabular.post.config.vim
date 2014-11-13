AddTabularPattern! eq /=
AddTabularPattern! json_hash /^[^:]*\zs:
AddTabularPattern! ruby_hash /^[^:]*:

nmap <Leader>a= :Tabularize eq<CR>
vmap <Leader>a= :Tabularize eq<CR>
nmap <Leader>a: :Tabularize ruby_hash<CR>
vmap <Leader>a: :Tabularize ruby_hash<CR>

