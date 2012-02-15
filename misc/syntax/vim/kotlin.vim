" Vim syntax file
" Language:     Kotlin
" Maintainer:   Bjarne Holen <bjarneholen@gmail.com>
" Last Change:  2012 Feb 14

" Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='kotlin'
endif

syn keyword   kotlinKeyword     namespace as type class this super val var fun
syn keyword   kotlinKeyword     for null true false is in throw return break 
syn keyword   kotlinKeyword     continue object if try else while do when 
syn keyword   kotlinKeyword     trait import where by get set abstract enum open 
syn keyword   kotlinKeyword     annotation override private public internal protected 
syn keyword   kotlinKeyword     catch out vararg inline finally final package
syn region	  kotlinString      start=+L\="+ skip=+\\\\\|\\"+ end=+"+

"color brightred "\<[A-Z_][0-9A-Z_]+\>" 

syn case ignore
syn match   kotlinNumber		 "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   kotlinNumber		 "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   kotlinNumber		 "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   kotlinNumber		 "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
syn match   kotlinCharacter      "'[^']*'"

syn case match
syn region  kotlinComment       start="/\*" end="\*/"
syn region  kotlinComment       start="//" skip="\\$" end="$" keepend

hi def link kotlinString        String
hi def link kotlinCharacter     Character
hi def link kotlinNumber        Number
hi def link kotlinFloat         Float
hi def link kotlinKeyword       Keyword
hi def link kotlinComment       Comment

let b:current_syntax = "kotlin"

