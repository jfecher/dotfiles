" Vim syntax file
" Language: Zy
" Maintainer: jfecher
" Latest Revision: 2015-09-11

if exists("b:current_syntax")
    syn keyword zyLangKeywords string int num print true false import for while if elif else
    syn match doubleLiteral '\d\+'
    syn match doubleLiteral '\-\d\+'
    syn match doubleLiteral '\d\+\.\d'
    syn match doubleLiteral '\-\d\+\.\d'
    syn match stringLiteral '\"[a-z,A-z]+\"'

    syn keyword notes contained TODO FIXME NOTE OUTPUT
    syn match comment '\~*\n' contains=notes
    syn match blockComment  '\`*\`' contains=notes

    fdsafd;

    hi def link zyLangKeywords Keyword
    hi def link doubleLiteral  Number
    hi def link stringLiteral  String
    hi def link notes          Todo
    hi def link comment        Comment
    hi def link blockComment   Comment
endif
