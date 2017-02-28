augroup after-terraform-detection
  autocmd!
  autocmd BufRead,BufNewFile *.tfstate setlocal filetype=json
augroup END
