syn keyword notes contained TODO FIXME XXX NOTE
syn match comment '\~.*$' contains=notes contains=mlcmt
syn region mlcmt start='`' end='`' contains=notes
syn region mlcmt start='#{' end='}' contains=notes

syn keyword anBool true false

syn keyword anType i8 i16 i32 i64
syn keyword anType u8 u16 u32 u64
syn keyword anType f16 f32 f64 isz usz
syn keyword anType c8 c32 void bool
syn match anType '\w\@<![A-Z]\w*'

syn match anOp '[+\-\*/%#@&=<>|!:]'

syn match anType '\'[a-z]\w*'

syn keyword anKeywords if elif else import with mut
syn keyword anKeywords for in do while let export
syn keyword anKeywords continue break return this is
syn keyword anKeywords ext new match trait module ante
syn keyword anKeywords enum type where when fun var
syn keyword anKeywords infect and or xor not then do

syn keyword anMods pub pro pri const raw pathogen noinit

syn match funcDef  '\(fun\)\@<= .\+\(:\@=\)' contains=anKewords,anType
" syn match funcCall '\w\@<!\w\+\((\@=\)' contains=anKewords
syn match funcCall '\([)\]"\'A-Za-z_0-9] *\)\@<![a-z]\w*\(\(\(\( *[(\'"\[]\)\|\( \+\w\)\)\@=\)\( *\(do\|then\|and\|or\|with\)\@!\)\)' contains=stringLiteral,charLiteral,anType,integerLiteral,doubleLiteral,anOp
syn match funcCall '\(\(and\|or\|not\|then\|match\|while\|if\|elif\|else\|import\|for\|in\|do\|then\|export\|return\|new\|match\|xor\|mut\) \+\)\@<=[a-z]\w*\(\( *[(\'"\[]\| \+\w\)\@=\)\( \+\(do\|then\|with\|and\|or\|in\)\@!\)' contains=stringLiteral,charLiteral,anType,integerLiteral,doubleLiteral,anOp
syn match funcCall '\(\(|>\) *\)\@<=[a-z]\w*' contains=stringLiteral,charLiteral,anType,integerLiteral,doubleLiteral,anOp
syn match funcCall '[a-z]\w*\(\( *<|\)\@=\)' contains=stringLiteral,charLiteral,anType,integerLiteral,doubleLiteral,anOp


syn match stringLiteral '\".\{-}\"'

syn match charLiteral '\'.\''
syn match charLiteral '\'\\.\''

syn match integerLiteral '\([A-Za-z0-9]\@<!\)[0-9_]\+\([ui]\(8\|16\|32\|64\)\)\?'
syn match integerLiteral '\([A-Za-z0-9]\@<!\)0b[01_]\+\([ui]\(8\|16\|32\|64\)\)\?'
syn match integerLiteral '\([A-Za-z0-9]\@<!\)0o[0-7_]\+\([ui]\(8\|16\|32\|64\)\)\?'
syn match integerLiteral '\([A-Za-z0-9]\@<!\)0x[0-9A-Fa-f_]\+\([ui]\(8\|16\|32\|64\)\)\?'

syn match doubleLiteral '\([A-Za-z0-9]\@<!\)\d\+\.\d*\(f\(16\|32\|64\)\)\?'


let b:current_syntax = "an"

hi def link notes          Todo
hi def link comment        Comment
hi def link mlcmt          Comment
hi def link anOp           Keyword
hi def link anKeywords     Keyword
hi def link anMods         Keyword
hi def link anBool         Boolean
hi def link funcDef        Function
hi def link funcCall       Function
hi def link anType         Type
hi def link stringLiteral  String
hi def link charLiteral    String
hi def link integerLiteral Number
hi def link doubleLiteral  Number
