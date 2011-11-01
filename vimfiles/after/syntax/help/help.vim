" after/syntax/help/cec.vim
" Author: Charles E. Campbell, Jr.
" Date:   Apr 07, 2007
" Version: 1c	ASTRO-ONLY
" My improvements to <help.vim> which Bram doesn't want
" ---------------------------------------------------------------------
let b:loaded_aftersyntaxhelp= "v1c"

" ---------------------------------------------------------------------
"  Clusters: {{{1
syn cluster helpSectionGroup	contains=helpBox1,helpBox2,helpBox3,helpBox4,helpBox5,helpCharacter,helpComment,helpConditional,helpConstant,helpDebug,helpDefine,helpDelimiter,helpError,helpExample,helpExample,helpExampleItem,helpException,helpFloat,helpFunction,helpHeader,helpHeadline,helpHyperTextEntry,helpHyperTextJump,helpIdentifier,helpInclude,helpKeyword,helpLabel,helpLeadBlank,helpMacro,helpNormal,helpNormal,helpNote,helpNote,helpNotVi,helpNumber,helpOperator,helpOption,helpPreCondit,helpPreProc,helpRepeat,helpSectionDelim,helpSectionTitle,helpSpecial,helpSpecial,helpSpecialChar,helpSpecialComment,helpStatement,helpStorageClass,helpString,helpStructure,helpTag,helpTitle,helpTodo,helpType,helpTypedef,helpUnderlined,helpURL,helpVim

" ---------------------------------------------------------------------
"  Extra Syntax: {{{1
 syn clear helpSectionDelim
 syn match helpSectionDelim		"^=\{3,}.*===$"	skipnl nextgroup=helpSection
 syn region helpSection		fold transparent contained	start="^\d\+\.\s" matchgroup=helpSectionDelim end="^=\+$"	contains=@helpSectionGroup skipnl nextgroup=helpSection
 syn match helpSectionTitle		"^[0-9]\+\.[^|]*\*[#-)!+-~]\+\*\ze\%(\s*{{{\d\)\=$"					contains=helpHyperTextEntry,helpSectionNmbr,helpTitleEnd
 syn match helpSectionTitle		"^\s*\zs\u[A-Z0-9,' ]*\s*\%({{{\d\+\)\=\%(\s*{{{\d\)\=$"				contains=helpSecTitleBlank,helpSecTitleGap
 syn match helpSectionTitle		"^\s*\zs\u[A-Z0-9,' ]*\(\s*\*[#-)!+-~]\+\*\)\+\%(\s*{{{\d\)\=$"				contains=helpHyperTextEntry,helpBlank,helpSecTitleBlank,helpSecTitleGap
 syn match helpTitleEnd      contained	"\s\+\ze\*"
 syn match helpSecTitleBlank contained	"\s\+"
 syn match helpSecTitleGap   contained	"\s\+\ze\*"
 syn match helpSectionNmbr   contained	"^[0-9]\+\.[0-9]*"
 syn match helpBox1			"[-+]\{3,}|\="
 syn match helpBox2			"\s|[| ]"
 syn match helpBox2			"||"
 syn match helpBox3			"[/\\+]===\+[/\\+|]\="
 syn match helpBox4			"===\+[/\\+|]\{1,2}"
 syn match helpBox5			"[- \t=][|+]\{1,2}$"
 syn match helpNormal			"-N-"
 syn match helpDate          contained	"\s*\u\l\l \d\{2}, \d\{4}$"		  contains=helpSecTitleBlank
 syn match helpTitle			"\%1l\u.*$"				  contains=helpDate
 syn match helpExample			"++[-=]*"				  nextgroup=helpExample
 syn match helpExampleItem		"^\s*\zsExamples\=\ze:"			  nextgroup=helpExampleDelim
 syn match helpExampleItem		"^\s*\zsExample\ze \d\+:"	skipwhite nextgroup=helpExampleNum
 syn match helpExampleItem		"^\s*\zsEx\.\ze \d\+:"		skipwhite nextgroup=helpExampleNum
 syn match helpExampleNum    contained	"\d\+"				skipwhite nextgroup=helpExampleDelim
 syn match helpExampleDelim  contained	":"
 syn clear helpNote
 syn match helpNote			"\cnote:"
 
" ---------------------------------------------------------------------
"  Extra Highlighting: {{{1
 hi link helpBox1			helpBox
 hi link helpBox2			helpBox
 hi link helpBox3			helpBox
 hi link helpBox4			helpBox
 hi link helpBox5			helpBox
 hi link helpSectionTitle		helpHeader
 hi link helpSecTitleBlank		helpSectionTitle
 hi link helpSectionNmbr		Statement
 hi link helpBox			Delimiter
 hi link helpTitle			PreProc
 hi link helpDate			Delimiter
 hi link helpExampleNum			Number
 hi link helpExampleDelim		Delimiter
 hi link helpExampleItem		Statement
 setlocal fdm=syntax

" ---------------------------------------------------------------------
"  Modelines: {{{1
" vim: ts=8 fdm=marker
