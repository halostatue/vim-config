" Show the stack of syntax highlighting classes affecting whatever is under
" the cursor.
function! s:SynStack() "{{{
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunction "}}}

command! SynStack call <SID>SynStack()

" Display diff with the file.
command! -nargs=1 -complete=file Diff vertical diffsplit <args>
" Display diff from last save.
command! DiffOrig vert new | setlocal bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" Disable diff mode.
command! -nargs=0 Undiff setlocal nodiff noscrollbind wrap

function! s:TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call <SID>TabMessage(<q-args>)
