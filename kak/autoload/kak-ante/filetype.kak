# http://ante.org
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.](an) %{
    set-option buffer filetype ante
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=ante %{
    require-module ante

    set-option buffer extra_word_chars '_' "'"
    hook window ModeChange pop:insert:.* -group ante-trim-indent  ante-trim-indent
    hook window InsertChar \n -group ante-indent ante-indent-on-new-line

    hook -once -always window WinSetOption filetype=.* %{ remove-hooks window ante-.+ }
}

hook -group ante-highlight global WinSetOption filetype=ante %{
    add-highlighter window/ante ref ante
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/ante }
}


provide-module ante %[

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/ante regions
add-highlighter shared/ante/code default-region group
add-highlighter shared/ante/string       region (?<!'\\)(?<!')"                 (?<!\\)(\\\\)*"  fill string
add-highlighter shared/ante/macro        region ^\h*?\K#                        (?<!\\)\n        fill meta
add-highlighter shared/ante/pragma       region -recurse \{- \{-#               '#-\}'           fill meta
add-highlighter shared/ante/comment      region /\*                             \*/              fill comment
add-highlighter shared/ante/line_comment region //(?:[^!#$%&*+.<>?@\\\^|~=]|$) $                 fill comment
add-highlighter shared/ante/quasiquote   region \[\b[_a-z]['\w]*#?\| \|\]                        regex \[\b[_a-z]['\w]*#?\|(.*?)\|\] 1:string

add-highlighter shared/ante/code/ regex (?<!')\b0x+[A-Fa-f0-9]+ 0:value
add-highlighter shared/ante/code/ regex (?<!')\b\d+([.]\d+)? 0:value
add-highlighter shared/ante/code/ regex (?<!')\b(true|false)(?!')\b 0:value
add-highlighter shared/ante/code/ regex (?<!')\b(import)(?!')\b 0:keyword
add-highlighter shared/ante/code/ regex (?<!')\b(trait|type|try|return|opaque|fn|impl|and|or|not|given|mut|extern)(?!')\b 0:keyword
add-highlighter shared/ante/code/ regex (?<!')\b(match|with|recur|do|else|if|in|then|while|for|break|continue)(?!')\b 0:attribute

add-highlighter shared/ante/code/ regex (?<!')\b(i8|i16|i32|i64|isz|u8|u16|u32|u64|usz|bool|char|unit|f32|f64|string|ref)(?!')\b 0:variable

# The complications below is because period has many uses:
# As function composition operator (possibly without spaces) like "." and "f.g"
# Hierarchical modules like "Data.Maybe"
# Qualified imports like "Data.Maybe.Just", "Data.Maybe.maybe", "Control.Applicative.<$>"
# Quantifier separator in "forall a . [a] -> [a]"
# Enum comprehensions like "[1..]" and "[a..b]" (making ".." and "Module..." illegal)

# matches uppercase identifiers:  Monad Control.Monad
# not non-space separated dot:    Just.const
add-highlighter shared/ante/code/ regex \b([A-Z]['\w]*\.)*[A-Z]['\w]*(?!['\w])(?![.a-z]) 0:variable

# matches infix identifier: `mod` `Apa._T'M`
add-highlighter shared/ante/code/ regex `\b([A-Z]['\w]*\.)*[\w]['\w]*` 0:operator
# matches imported operators: M.! M.. Control.Monad.>>
# not operator keywords:      M... M.->
add-highlighter shared/ante/code/ regex \b[A-Z]['\w]*\.[~<=>|:!?/.@$*&#%+\^\-\\]+ 0:operator
# matches dot: .
# not possibly incomplete import:  a.
# not other operators:             !. .!
add-highlighter shared/ante/code/ regex (?<![\w~<=>|:!?/.@$*&#%+\^\-\\])\.(?![~<=>|:!?/.@$*&#%+\^\-\\]) 0:operator
# matches other operators: ... > < <= ^ <*> <$> etc
# not dot: .
# not operator keywords:  @ .. -> :: ~
add-highlighter shared/ante/code/ regex (?<![~<=>|:!?/.@$*&#%+\^\-\\])[~<=>|:!?/.@$*&#%+\^\-\\]+ 0:operator

# matches operator keywords: @ ->
add-highlighter shared/ante/code/ regex (?<![~<=>|:!?/.@$*&#%+\^\-\\])(@|~|<-|->|=>|::|=|:|[|])(?![~<=>|:!?/.@$*&#%+\^\-\\]) 1:keyword
# matches: forall [..variables..] .
# not the variables
add-highlighter shared/ante/code/ regex \b(forall|∀)\b[^.\n]*?(\.) 1:keyword 2:keyword

# matches 'x' '\\' '\'' '\n' '\0'
# not incomplete literals: '\'
# not valid identifiers:   w' _'
add-highlighter shared/ante/code/ regex \B'([^\\]|[\\]['"\w\d\\])' 0:string
# this has to come after operators so '-' etc is correct

# matches function names in type signatures
add-highlighter shared/ante/code/ regex ^\s*(?:where\s+|let\s+|default\s+)?([_a-z]['\w]*#?(?:,\s*[_a-z]['\w]*#?)*)\s+::\s 1:meta

# Commands
# ‾‾‾‾‾‾‾‾

# http://en.wikibooks.org/wiki/Haskell/Indentation

define-command -hidden ante-trim-indent %{
    # remove trailing white spaces
    try %{ execute-keys -draft -itersel <a-x> s \h+$ <ret> d }
}

define-command -hidden ante-indent-on-new-line %{
    evaluate-commands -draft -itersel %{
        # copy -- comments prefix and following white spaces
        try %{ execute-keys -draft k <a-x> s ^\h*\K--\h* <ret> y gh j P }
        # preserve previous line indent
        try %{ execute-keys -draft <semicolon> K <a-&> }
        # align to first clause
        try %{ execute-keys -draft <semicolon> k x X s ^\h*(if|then|else)?\h*(([\w']+\h+)+=)?\h*(case\h+[\w']+\h+of|do|let|where)\h+\K.* <ret> s \A|.\z <ret> & }
        # filter previous line
        try %{ execute-keys -draft k : ante-trim-indent <ret> }
        # indent after lines beginning with condition or ending with expression or =(
        try %{ execute-keys -draft <semicolon> k x <a-k> ^\h*if|[=(]$|\b(case\h+[\w']+\h+of|do|let|where)$ <ret> j <a-gt> }
    }
}

]
