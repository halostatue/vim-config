" we need the conceal feature (vim ≥ 7.3)
if !has('conceal') || &enc != 'utf-8' || exists('g:no_cstyle_fancychars')
  finish
endif

let s:ft = &ft

if (s:ft == 'objc' || s:ft == 'c') && exists('g:no_c_fancychars')
  finish
endif

if (s:ft == 'objcpp' || s:ft == 'cpp') && exists('g:no_cpp_fancychars')
  finish
endif

" Assignment operator
syntax match cStyleNiceOperator "[^=!]=[^=]"ms=s+1,me=e-1 containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=←
" syntax match cStyleNiceOperator "=" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=⟵

" Arithmetic operators
" syntax match cStyleNiceOperator "\s+\s"ms=s+1,me=e-1 containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=+
syntax match cStyleNiceOperator "\s-\s"ms=s+1,me=e-1 containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=−
syntax match cStyleNiceOperator "\s\*\s"ms=s+1,me=e-1 containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=×
syntax match cStyleNiceOperator "\s/\s"ms=s+1,me=e-1 containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=÷
" syntax match cStyleNiceOperator "\s%\s"ms=s%1,me=e-1 containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=%

if exists('b:c_style_fancychars_incrdecr') || exists('g:c_style_fancychars_incrdecr')
  syntax match cNiceOperator "++" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=Δ " ++ increment
  syntax match cNiceOperator "--" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=∇ " -- decrement
endif

" Comparison/relational operators
syntax match cStyleNiceOperator "==" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=≡ " equivalence
syntax match cStyleNiceOperator "!=" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=≠ " unequivalence
syntax match cStyleNiceOperator "<=" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=≤ " less than or equal to
syntax match cStyleNiceOperator ">=" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=≥ " greater than or eqal to
" syntax match cStyleNiceOperator "<" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=< " less than
" syntax match cStyleNiceOperator ">" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=> " greater than

" Logical operators
if exists('b:c_style_fancychars_logical') || exists('g:c_style_fancychars_logical')
  syntax match cStyleNiceOperator "![^=]"me=e-1 containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=¬
  syntax match cStyleNiceOperator "&&" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=∧
  syntax match cStyleNiceOperator "||" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=∨
endif

" Bitwise operators
" syntax match cStyleNiceOperator "~" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=~
" syntax match cStyleNiceOperator "&" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=&
" syntax match cStyleNiceOperator "|" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=|
" syntax match cStyleNiceOperator "^" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=^
" syntax match cStyleNiceOperator "^" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=⊻
"syntax match cStyleNiceOperator "<<" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=≪
syntax match cStyleNiceOperator "<<" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=«
"syntax match cStyleNiceOperator ">>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=≫
syntax match cStyleNiceOperator ">>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=»

" Dereference
syntax match cStyleNiceOperator "->" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=→
" syntax match cStyleNiceOperator "->" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=➞

if s:ft == 'cpp' || s:ft == 'objcpp'
  syntax match cStyleNiceOperator "::" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=∷
endif

" Trigraphs
syntax match cStyleNiceOperator "??=" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=#
syntax match cStyleNiceOperator "??/" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=\
syntax match cStyleNiceOperator "??'" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=^
syntax match cStyleNiceOperator "??(" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=[
syntax match cStyleNiceOperator "??)" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=]
syntax match cStyleNiceOperator "??!" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=|
syntax match cStyleNiceOperator "??<" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar={
syntax match cStyleNiceOperator "??>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=}
syntax match cStyleNiceOperator "??-" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=~

" Alternative tokens
syntax match cStyleNiceOperator "<%" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar={
syntax match cStyleNiceOperator "%>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=}
syntax match cStyleNiceOperator "<:" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=[
syntax match cStyleNiceOperator ":>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=]
syntax match cStyleNiceOperator "%:" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=#
syntax match cStyleNiceOperator "\<and\>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=∧
syntax match cStyleNiceOperator "\<or\>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=∨
syntax match cStyleNiceOperator "\<not\>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=¬
syntax match cStyleNiceOperator "\<not_eq\>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=≠

" Ellipsis; varargs
syntax match cStyleNiceOperator "\.\.\." containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=…

if exists('b:c_style_fancychars_names') || exists('g:c_style_fancychars_names')
  syntax keyword cStructure enum conceal cchar=∈
  syntax keyword cStructure union conceal cchar=⋃
  syntax keyword cStructure struct conceal cchar=⊇
  syntax keyword cOperator sizeof conceal cchar=𝔠

  if s:ft == 'cpp' || s:ft == 'objcpp'
    syntax keyword cppStructure class conceal cchar=⋑
  endif

  syntax keyword cStatement return conceal cchar=⏎
  syntax keyword cStatement break conceal cchar=↴
  syntax keyword cStatement continue conceal cchar=↰
  syntax keyword cStatement goto conceal cchar=↷

  syntax keyword cType void conceal cchar=∅
  syntax keyword cType unsigned conceal cchar=ℕ
  syntax keyword cType int short conceal cchar=ℤ
  syntax keyword cType float double conceal cchar=ℝ

  syntax match cStyleNiceOperator "\<\(std::\|\)sqrt\>" containedin=ALLBUT,cComment,cCommentL,cString,cCppString,cCommentString conceal cchar=√
endif

hi link cStyleNiceOperator Operator
hi! link Conceal Operator

setlocal conceallevel=2
