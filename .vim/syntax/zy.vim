syn keyword notes contained TODO FIXME XXX NOTE
syn match comment '\~.*$' contains=notes
syn region comment start='`' end='`' contains=notes

syn keyword zyTypes    i8 i16 i32 i64
syn keyword zyTypes    u8 u16 u32 u64
syn keyword zyTypes    f32 f64
syn keyword zyTypes    void str bool
syn keyword zyTypes    type
syn keyword zyBool     true false

syn keyword zyKeywords if elif else import print
syn keyword zyKeywords for foreach in do while
syn keyword zyKeywords continue break return this
syn keyword zyKeywords pub pri pro const ext new match
syn keyword zyKeywords class struct enum where dyn
syn keyword zyKeywords pathogen infect cleanse ct

syn match funcDef  '\w\@<!\w\+\(\:\@=\)' contains=zyKewords
syn match funcCall '\w\@<!\w\+\((\@=\)' contains=zyKewords

syn match userType '\w\@<![A-Z]\w*'

syn match stringLiteral '\".\{-}\"'
syn match stringLiteral '\'.\{-}\''

syn match integerLiteral '\([A-Za-z0-9]\@<!\)\d\+'
syn match doubleLiteral '\([A-Za-z0-9]\@<!\)\d\+\.\d*'


let b:current_syntax = "zy"

hi def link notes          Todo
hi def link comment        Comment
hi def link zyKeywords     Keyword
hi def link zyTypes        Type
hi def link zyBool         Boolean
hi def link funcDef        Function
hi def link funcCall       Function
hi def link userType       Type
hi def link stringLiteral  String
hi def link integerLiteral Number
hi def link doubleLiteral  Number
