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

function! s:BranchCalc()
    let @b = FugitiveHead()
    if !empty($vimBranch )
        let @d = $vimBranch
    else
        call inputsave()
        let @d = input('Enter Diff Branch: ')
        call inputrestore()
    endif
endfunction
command! BranchCalc call s:BranchCalc()
