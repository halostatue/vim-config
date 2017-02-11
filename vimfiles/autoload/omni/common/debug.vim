" Omnicompletion debug functions, originally by Vissale NEANG.

let s:OMNI_DEBUG_TRACE = []

function! omni#common#debug#start() abort
  let s:OMNI_DEBUG_TRACE = []
  call extend(s:OMNI_DEBUG_TRACE, [ '============ Debug Start ============' ])
  call writefile(s:OMNI_DEBUG_TRACE, 'omni.dbg')
endfunction

function! omni#common#debug#end() abort
  call extend(s:OMNI_DEBUG_TRACE, [ '============= Debug End =============', '' ])
  call writefile(s:OMNI_DEBUG_TRACE, 'omni.dbg')
endfunc

" Debug trace function
function! omni#common#debug#trace(name, ...) abort
  let l:trace = a:name
  let l:params = a:0
  if l:params
    let l:trace .= ':'
  endif

  for l:i in range(l:params)
    let l:trace = l:trace . ' (' . string(a:000[l:i + 1]) . ')'
  endfor

  call extend(s:OMNI_DEBUG_TRACE, [ l:trace ])
endfunc
