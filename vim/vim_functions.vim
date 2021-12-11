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
    let @a = FugitiveHead()
    let @b = system("git branch -a")
    vnew
    put =@b
    wincmd l
    normal ggdd
endfunction
command! BranchCalc call s:BranchCalc()

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

"------------------------------------------------------------------------------"
"             BranchReturn: Grabs git branch name from BranchCalc()            "
"------------------------------------------------------------------------------"

function! s:BranchReturn()
    let @b = line(".")."s"."/\\\<[a-zA-Z0-9_-]\\\+$/\\\=setreg('c',submatch(0))/n"
endfunction
command! BranchReturn call s:BranchReturn()

"------------------------------------------------------------------------------"
"            ClearClose: Clear search register and close open window           "
"------------------------------------------------------------------------------"
function! s:ClearClose()
    let @/=""
    close!
endfunction
command! ClearClose call s:ClearClose()

"------------------------------------------------------------------------------"
"             Hover: Allows you to turn on python help for commands            "
"------------------------------------------------------------------------------"
let s:ycm_hover_popup=-1
function s:Hover()
  let response = youcompleteme#GetCommandResponse( 'GetDoc' )
  if response == ''
    return
endif
  call popup_hide( s:ycm_hover_popup ) 
  let s:ycm_hover_popup = popup_atcursor( balloon_split( response ), {} )
endfunction
command! Hover call s:Hover()
