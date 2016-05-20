" Rulers
iab raz abcdefghijklmnopqrstuvwxyz
iab Raz ABCDEFGHIJKLMNOPQRSTUVWXYZ
iab r10 1234567890
iab r40 1234567890123456789012345678901234567890
iab r80 12345678901234567890123456789012345678901234567890123456789012345678901234567890
iab r72 123456789012345678901234567890123456789012345678901234567890123456789012
iab R10 ----------
iab R40 ----------------------------------------
iab R80 --------------------------------------------------------------------------------
iab R72 ------------------------------------------------------------------------

" General echo editing abbreviations
" yyyymmdd
iab cdate <C-R>=strftime("%Y%m%d")<CR>
" yyyy.mm.dd
iab cfdate <C-R>=strftime("%Y.%m.%d")<CR>
" hh:mm
iab ctime <C-R>=strftime("%H:%M")<CR>
" yyyymmdd hh:mm
iab cdatetime <C-R>=strftime("%Y%m%d %H:%M")<CR>
" yyyy.mm.dd hh:mm
iab cfdatetime <C-R>=strftime("%Y.%m.%d %H:%M")<CR>
" system long date
iab clongdate <C-R>=strftime("%a %b %d %X %z %Y")<CR>
" formatted long date
iab cpdate <C-R>=strftime("%A, %d %B %Y")<CR>
" ISO datetime
iab cisodt <C-R>=strftime("%Y-%m-%dT%H:%M:%S%z")<CR>
iab cdt <C-R>=strftime("%Y-%m-%dT%H:%M:%S%z")<CR>
