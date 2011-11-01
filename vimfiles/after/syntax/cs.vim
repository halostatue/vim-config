if exists("cs_no_comment_fold")
  syn region csComment start="/\*" end="\*/" contains=@csCommentHook,csTodo,@Spell
else
  syn region csComment start="/\*" end="\*/" contains=@csCommentHook,csTodo,@Spell fold
endif

syn region csFold start="{" end="}" transparent fold
syn sync fromstart
