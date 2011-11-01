" blockhl.vim: highlights different levels of {} with different shades of
"              grey.  Only good for gvim and C/C++.
"  Author: Charles E. Campbell, Jr.
"  Date:   Feb 01, 2007
"  Version: 5	ASTRO-ONLY
"  History:
"     5  : Aug 23, 2004: ToggleBlockHL() function provided which toggles
"                        between block-highlighting and no such highlighting
"          Apr 12, 2005  vim version 700+ now uses the ColorScheme event
"                        instead of CursorHold to restore block-highlighting
"                        when the colorscheme is changed
"     4  : Jul 01, 2004: optionally supports entire-line rather than just
"                        leading whitespace
"                        uses cursorhold to restore highlighting after a
"                        colorscheme change
"                        bugfix: an ALLBUT in cParen caused cCurly7
"                        to do inside-() highlighting.
"     3  : Jun 30, 2004: now supports dark and light background settings
"     2  : Jun 24, 2002: has("menu") now part of test
"     1  : the epoch   :
"
" GetLatestVimScripts: 104 1 blockhl.vim
if !exists("g:loaded_blockhl")
 let g:loaded_blockhl= 1
else
 let g:loaded_blockhl= 2
endif
let g:blockhl_version= "v5"

if has("gui_running")

 " ---------------------------------------------------------------------
 " Block Highlighting Syntax: {{{1
" call Decho("Setting up block highlighting syntax")
 syn cluster cCurlyGroup	  contains=cConditional,cConstant,cLabel,cOperator,cRepeat,cStatement,cStorageClass,cStructure,cType,cBitField,cCharacter,cCommentError,cInclude,cNumbers,cParenError,cPreCondit,cSpaceError,cSpecialCharacter,cSpecialError,cUserCont,cBracket,cComment,cCommentL,cCppOut,cCppString,cDefine,cMulti,cParen,cPreCondit,cPreProc,cString
 syn cluster cParenGroup	  add=cCurly1,cCurly2,cCurly3,cCurly4,cCurly5,cCurly6,cCurly7,cLead1,cLead2,cLead3,cLead4,cLead5,cLead6,cLead7
 syn region cCurly1			  transparent	matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead1,cCurly2,@cCurlyGroup
 syn region cCurly2 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead2,cCurly3,@cCurlyGroup
 syn region cCurly3 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead3,cCurly4,@cCurlyGroup
 syn region cCurly4 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead4,cCurly5,@cCurlyGroup
 syn region cCurly5 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead5,cCurly6,@cCurlyGroup
 syn region cCurly6 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead6,cCurly7,@cCurlyGroup
 syn region cCurly7 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead7,cCurly1,@cCurlyGroup

 syn match  cLead1  contained   "^\s\+"
 syn match  cLead2  contained   "^\s\+"
 syn match  cLead3  contained   "^\s\+"
 syn match  cLead4  contained   "^\s\+"
 syn match  cLead5  contained   "^\s\+"
 syn match  cLead6  contained   "^\s\+"
 syn match  cLead7  contained   "^\s\+"

 " ---------------------------------------------------------------------
 "  Do Once: {{{1
 if g:loaded_blockhl == 1
"  call Decho("gui_running and loaded_blockhl=".g:loaded_blockhl)
  com! ToggleBlockHL call ToggleBlockHL()
  let s:blockhl_path    = expand("<sfile>")

 " ---------------------------------------------------------------------
  " HLTest: tests if a highlighting group has been set up {{{2
  "         This function is used by the CursorHold below, which
  "         is there primarily to support continued blockhl
  "         highlighting after the colorscheme has been changed
  fun! BlockHLTest(hlname)
"  	call Dfunc("BlockHLTest(hlname<".a:hlname.">)")
    let id_hlname= hlID(a:hlname)
    if id_hlname == 0
"  	 call Dret("BlockHLTest 0 : id_hlname==0")
     return 0
    endif
    let id_trans = synIDtrans(id_hlname)
    if id_trans == 0
"  	 call Dret("BlockHLTest 0 : id_trans==0")
     return 0
    endif
    let fg_hlname= synIDattr(id_trans,"fg")
    let bg_hlname= synIDattr(id_trans,"bg")
    if fg_hlname == "" && bg_hlname == ""
"  	 call Dret("BlockHLTest 0 : fg_hlname<".fg_hlname."> bg_hlname<".bg_hlname.">")
     return 0
    endif
"  	 call Dret("BlockHLTest 1")
    return 1
  endfun

 " ---------------------------------------------------------------------
 " ToggleBlockHL: calling this function toggle block-highlighting {{{2
  fun! ToggleBlockHL()

    if !exists("s:blockhl_enabled")
     let s:blockhl_enabled= 0
    endif
"  	call Dfunc("ToggleBlockHL() blockhl_enabled=".s:blockhl_enabled)

    if s:blockhl_enabled
     " Disable blockhl-highlighting
     augroup AU_BlockHL
      au!
     augroup END
	 augroup! AU_BlockHL
     let s:blockhl_enabled= 0
     hi clear cLead1
     hi clear cLead2
     hi clear cLead3
     hi clear cLead4
     hi clear cLead5
     hi clear cLead6
     hi clear cLead7

    else
     " Enable blockhl-highlighting

     " Colorscheme change handling
     let s:blockhl_enabled = 1
"	 call Decho("blockhl_path<".s:blockhl_path.">")
     if &bg == "dark"
      hi cLead1 term=NONE cterm=NONE gui=NONE guibg=grey10
      hi cLead2 term=NONE cterm=NONE gui=NONE guibg=grey20
      hi cLead3 term=NONE cterm=NONE gui=NONE guibg=grey25
      hi cLead4 term=NONE cterm=NONE gui=NONE guibg=grey30
      hi cLead5 term=NONE cterm=NONE gui=NONE guibg=grey35
      hi cLead6 term=NONE cterm=NONE gui=NONE guibg=grey40
      hi cLead7 term=NONE cterm=NONE gui=NONE guibg=grey45
     else
      hi cLead1 term=NONE cterm=NONE gui=NONE guibg=grey90
      hi cLead2 term=NONE cterm=NONE gui=NONE guibg=grey80
      hi cLead3 term=NONE cterm=NONE gui=NONE guibg=grey75
      hi cLead4 term=NONE cterm=NONE gui=NONE guibg=grey70
      hi cLead5 term=NONE cterm=NONE gui=NONE guibg=grey65
      hi cLead6 term=NONE cterm=NONE gui=NONE guibg=grey60
      hi cLead7 term=NONE cterm=NONE gui=NONE guibg=grey55
     endif
     augroup AU_BlockHL
      au!
      if v:version >= 700
       exe 'au ColorScheme *.c if !BlockHLTest("cLead1")|let s:blockhl_enabled=0|ToggleBlockHL|endif'
	  else
       exe 'au CursorHold *.c if !BlockHLTest("cLead1")|let s:blockhl_enabled=0|ToggleBlockHL|endif'
	  endif
     augroup END
    endif

"  	call Dret("ToggleBlockHL : blockhl_enabled=".s:blockhl_enabled)
  endfun

  " following command responsible for first turning on BlockHL highlighting
  ToggleBlockHL
 endif

" }}}1
endif
" vim: ts=4 fdm=marker ft=vim
