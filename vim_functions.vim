"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"              ZoomToggle: Switches fullscreen and all buffer mode             "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()

"------------------------------------------------------------------------------"
"     BranchCalc: Determines git branch for diffing from $env or user input     "
"------------------------------------------------------------------------------"
function! s:BranchCalc()
    let @b = FugitiveHead()
    let @a = system("git branch -a")
    vnew
    put =@a
    wincmd l
endfunction
command! BranchCalc call s:BranchCalc()

"------------------------------------------------------------------------------"
"                   GitBranchInput: Requests Git Branch Input                  "
"------------------------------------------------------------------------------"
function! s:GitBranchInput()
    if !empty($git_branch)
        let @d = $git_branch
    else
        call inputsave()
        let @d = input('Enter Diff Branch: ')
        call inputrestore()
    endif
    close!
endfunction
command! GitBranchInput call s:GitBranchInput()

"------------------------------------------------------------------------------"
"       BranchCalcOverride: User git_branch $env if set, otherwise nothing     "
"------------------------------------------------------------------------------"
function! s:BranchCalcOverride()
    if !empty($git_branch)
        let @d = $git_branch
    else
        let @d =""
    endif
endfunction
command! BranchCalcOverride call s:BranchCalcOverride()
