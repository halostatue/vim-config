finish
if exists('g:no_cpp_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif

" Unary functions/methods

hi! link cStyleNiceOperator Operator
hi! link cppNiceStatement Statement
hi! link containedin=ALL conceal Operator

setlocal conceallevel=2
