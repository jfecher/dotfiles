setlocal indentexpr=zyIndent()

function! zyIndent()
    let line = getline(v:lnum)
    let prevNum = prevnonblank(v:lnum - 1)
    let prev = getline(prevNum)

    if prev =~ "{" && prev !~ "}"
        return indent(prevNum) + 4
    endif
endfunction
