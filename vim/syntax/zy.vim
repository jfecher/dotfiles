syn keyword notes contained TODO FIXME XXX NOTE
syn match comment '\~.*$' contains=notes
syn region comment start='`' end='`' contains=notes

syn keyword zyKewords num int string bool  
syn keyword zyKewords if elif else import print
syn keyword zyKewords for foreach in do while
syn keyword zyKewords true false continue break
syn keyword zyKewords pub pri pro const

syn match func '--[^(\:]*' contains=zyKewords

syn match stringLiteral '\".*\"'
syn match stringLiteral '\'.*\''

syn match integerLiteral '\([A-Za-z]\@<!\)\d\+'
syn match doubleLiteral '\([A-Za-z]\@<!\)\d\+\.\d*'


let b:current_syntax = "zy"

hi def link notes          Todo
hi def link comment        Comment
hi def link zyKewords      Keyword
hi def link func           Function
hi def link stringLiteral  String
hi def link integerLiteral Number
hi def link doubleLiteral  Number
