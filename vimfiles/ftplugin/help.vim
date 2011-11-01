if exists('b:did_help_ftplugin')
  finish
endif

let b:did_help_ftplugin=1

nmap <buffer> <CR> <C-]>
nmap <buffer> <BS> <C-T>
nmap <buffer> o /'[a-z]\{2,\}'<CR>
nmap <buffer> O ?'[a-z]\{2,\}'<CR>
nmap <buffer> s /\|\S\+\|<CR>
nmap <buffer> S ?\|\S\+\|<CR>
