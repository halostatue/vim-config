scriptencoding utf-8

if has_key(b:, 'did_macros_c_style')
  finish
endif

let b:did_macros_c_style=1

" Set tabstops, soft tabstops, shift width to 4 spaces, and text width to 118
" set ts=4 sts=4 sw=4 tw=118
" Expands tabs, autoindents, uses C indentation mode, and smart tabs.
set expandtab autoident cindent smarttab

setlocal cinoptions=
setlocal cinoptions+=>s " Normal indent by shiftwidth
setlocal cinoptions+=e0 " modify indent ±0 when /{$/
setlocal cinoptions+=n0 " modify indent ±0 for braceless control block
setlocal cinoptions+=f0 " first brace in column 0
setlocal cinoptions+={0 " modify opening brace indent by ±0
setlocal cinoptions+=}0 " modify closing brace indent by ±0
setlocal cinoptions+=^0 " modify indent inside braces by ±0
setlocal cinoptions+=:s " case labels are <sw> from switch()
setlocal cinoptions+==0 " modify case statement indent by ±0
setlocal cinoptions+=l1 " align statements relative to case label
setlocal cinoptions+=b0 " align break with statements, not case label
setlocal cinoptions+=g0 " scope declarations align with braces
setlocal cinoptions+=hs " statements after scope statements are indented <sw>
setlocal cinoptions+=ps " K&R parameters are indented <sw>
setlocal cinoptions+=ts " return type declarations are indented <sw>
setlocal cinoptions+=is " indent C++ base classes and cinits <sw>
setlocal cinoptions+=+s " indent continuation lines <sw>
setlocal cinoptions+=c3 " indent comment lines +3 after comment opener.
setlocal cinoptions+=C0 " Comments behave correctly
setlocal cinoptions+=/0 " Indent comments <sw> extra
setlocal cinoptions+=(0 " Indent continuation in unclosed parens 2<sw>
setlocal cinoptions+=u0 " Same as above, one level deeper, add <sw>
setlocal cinoptions+=U0 " Ignore (/u if parens is first non-ws char.
setlocal cinoptions+=w1 " Line up with first unclosed paren.
setlocal cinoptions+=W0 " Unclosed paren change.
setlocal cinoptions+=m0 " Parens line up properly
setlocal cinoptions+=M0 " Parens line up properly
setlocal cinoptions+=j1 " Anonymous classes are indented correctly.
setlocal cinoptions+=)20 " Unclosed parens up to 20 lines away
setlocal cinoptions+=*30 " Unclosed comments up to 30 lines away

setlocal foldcolumn=2
setlocal foldmethod=syntax
