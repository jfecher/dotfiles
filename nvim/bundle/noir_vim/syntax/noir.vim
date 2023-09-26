syn keyword notes contained TODO FIXME XXX NOTE

syn keyword nrBool true false

syn keyword nrType i8 i16 i32 i64
syn keyword nrType u8 u16 u32 u64
syn keyword nrType unit bool str Field
syn match nrType '\w\@<![A-Z]\w*'

syn match nrOp '[+^\-\*/%#@&=<>|!?]'

syn match comment '//.*$' contains=notes,mlcmt
syn region mlcmt start='/\*' end='\*/' contains=notes
syn region preproc start='#\[' end=']' contains=comment,mlcmt,nrFnCall,stringLiteral,charLiteral,integerLiteral,doubleLiteral,nrType

syn match preproc '![a-z_]\w*'

syn match nrModule '\<[A-Z]\w*\.'

syn keyword nrKeywords if else use module
syn keyword nrKeywords for in let mod type unconstrained
syn keyword nrKeywords return fn global open
syn keyword nrKeywords impl trait comptime pub
syn keyword nrKeywords struct constrain const
syn keyword nrKeywords as effect handle handler

syn keyword nrModifiers mut

syn match nrFnCall '\w+('

syn region stringLiteral start='"' end='"'

syn match charLiteral '\'.\''
syn match charLiteral '\'\\.\''

syn match integerLiteral '\([A-Za-z0-9]\@<!\)[0-9_]\+\([ui]\(8\|16\|32\|64\|sz\)\)\?'
syn match integerLiteral '\([A-Za-z0-9]\@<!\)0b[01_]\+\([ui]\(8\|16\|32\|64\|sz\)\)\?'
syn match integerLiteral '\([A-Za-z0-9]\@<!\)0o[0-7_]\+\([ui]\(8\|16\|32\|64\|sz\)\)\?'
syn match integerLiteral '\([A-Za-z0-9]\@<!\)0x[0-9A-Fa-f_]\+\([ui]\(8\|16\|32\|64\|sz\)\)\?'

syn match doubleLiteral '\([A-Za-z0-9]\@<!\)\d\+\.\d*\(f\(16\|32\|64\)\)\?'

syn match nrFnCall /\w\+\s*(/me=e-1,he=e-1
syn match nrType /\<[A-Z]\w*\>/

let b:current_syntax = "nr"

hi def link notes          Todo
hi def link comment        Comment
hi def link mlcmt          Comment
hi def link preproc        PreProc
hi def link quote          PreProc
hi def link nrOp           Keyword
hi def link nrKeywords     Keyword
hi def link nrModifiers    Keyword
hi def link nrBool         Boolenr
hi def link nrFnCall       Function
hi def link nrModPath      ModPath
hi def link nrType         Type
hi def link stringLiteral  String
hi def link charLiteral    String
hi def link integerLiteral Number
hi def link doubleLiteral  Number

hi def link nrControl      ModPath
