" A simple Vim / Neovim statusline.
"
" URL:          github.com/bluz71/vim-mistfly-statusline
" License:      MIT (https://opensource.org/licenses/MIT)

if exists('g:loaded_mistfly_statusline')
  finish
endif
let g:loaded_mistfly_statusline = 1

" The symbol used to indicate the presence of errors in the current buffer. By
" default the U+2715 multiplication symbol will be used.
let g:mistflyErrorSymbol = get(g:, 'mistflyErrorSymbol', '✕')

" The symbol used to indicate the presence of warnings in the current buffer. By
" default the exclamation symbol will be used.
let g:mistflyWarningSymbol = get(g:, 'mistflyWarningSymbol', '!')

" By default do not enable Neovim's window bar.
let g:mistflyWinBar = get(g:, 'mistflyWinBar', 0)

" By default display Git branches.
let g:mistflyWithGitBranch = get(g:, 'mistflyWithGitBranch', 1)

" By default don't display Git branches with the U+E0A0 branch character.
let g:mistflyWithGitBranchCharacter = get(g:, 'mistflyWithGitBranchCharacter', 0)

" By default don't display Gitsigns status.
let g:mistflyWithGitsignsStatus = get(g:, 'mistflyWithGitsignsStatus', 0)

" By default do not display indentation details.
let g:mistflyWithIndentStatus = get(g:, 'mistflyWithIndentStatus', 0)

" By default don't display a Nerd Font filetype icon.
let g:mistflyWithNerdIcon = get(g:, 'mistflyWithNerdIcon', 0)

" By default don't indicate Neovim Diagnostic status.
let g:mistflyWithNvimDiagnosticStatus = get(g:, 'mistflyWithNvimDiagnosticStatus', 0)

" By default don't indicate ALE lint status.
let g:mistflyWithALEStatus = get(g:, 'mistflyWithALEStatus', 0)

" By default don't indicate Coc lint status.
let g:mistflyWithCocStatus = get(g:, 'mistflyWithCocStatus', 0)

" By default don't use geometric shapes, U+25A0 - Black Square & U+25CF - Black
" Circle, to indicate the obsession (https://github.com/tpope/vim-obsession)
" status.
let g:mistflyWithObessionGeometricCharacters = get(g:, 'mistflyWithObessionGeometricCharacters', 0)

function! s:StatusLine(active) abort
    if &buftype ==# 'nofile' || &filetype ==# 'netrw'
        " Likely a file explorer.
        setlocal statusline=%!mistfly_statusline#NoFileStatusLine()
        if exists('&winbar')
            setlocal winbar=
        endif
    elseif &buftype ==# 'nowrite'
        " Don't set a custom status line for certain special windows.
        return
    elseif a:active == v:true
        setlocal statusline=%!mistfly_statusline#ActiveStatusLine()
        if g:mistflyWinBar && exists('&winbar')
            setlocal winbar=%!mistfly_statusline#ActiveWinBar()
        endif
    elseif a:active == v:false
        setlocal statusline=%!mistfly_statusline#InactiveStatusLine()
        if g:mistflyWinBar && exists('&winbar') && winheight(0) > 1
            setlocal winbar=%!mistfly_statusline#InactiveWinBar()
        endif
    endif
endfunction

" Iterate though the windows and update the statusline and winbar for all
" inactive windows.
"
" This is needed when starting Vim with multiple splits, for example 'vim -O
" file1 file2', otherwise all statuslines/winbars will be rendered as if they
" are active. Inactive statuslines/winbar are usually rendered via the WinLeave
" and BufLeave events, but those events are not triggered when starting Vim.
"
" Note - https://jip.dev/posts/a-simpler-vim-statusline/#inactive-statuslines
function! s:UpdateInactiveWindows() abort
    for winnum in range(1, winnr('$'))
        if winnum != winnr()
            call setwinvar(winnum, '&statusline', '%!mistfly_statusline#InactiveStatusLine()')
            if g:mistflyWinBar && exists('&winbar') && winheight(0) > 1
                call setwinvar(winnum, '&winbar', '%!mistfly_statusline#InactiveWinBar()')
            endif
        endif
    endfor
endfunction

function! s:UserColors() abort
    if !hlexists('MistflyNormal') || synIDattr(synIDtrans(hlID('MistflyNormal')), 'bg') == ''
        highlight! link MistflyNormal DiffText
    endif
    if !hlexists('MistflyInsert') || synIDattr(synIDtrans(hlID('MistflyInsert')), 'bg') == ''
        highlight! link MistflyInsert DiffAdd
    endif
    if !hlexists('MistflyVisual') || synIDattr(synIDtrans(hlID('MistflyVisual')), 'bg') == ''
        highlight! link MistflyVisual Search
    endif
    if !hlexists('MistflyReplace') || synIDattr(synIDtrans(hlID('MistflyReplace')), 'bg') == ''
        highlight! link MistflyReplace DiffDelete
    endif
    if !hlexists('MistflyEmphasis') || synIDattr(synIDtrans(hlID('MistflyEmphasis')), 'bg') == ''
        highlight! link MistflyEmphasis StatusLine
    endif
    if !hlexists('MistflyNotification') || synIDattr(synIDtrans(hlID('MistflyNotification')), 'bg') == ''
        highlight! link MistflyNotification StatusLine
    endif
endfunction

augroup mistflyStatuslineEvents
    autocmd!
    autocmd VimEnter              * call s:UpdateInactiveWindows()
    autocmd ColorScheme,SourcePre * call s:UserColors()
    autocmd WinEnter,BufWinEnter  * call s:StatusLine(v:true)
    autocmd WinLeave              * call s:StatusLine(v:false)
    if exists('##CmdlineEnter')
        autocmd CmdlineEnter      * call s:StatusLine(v:true) | redraw
    endif
augroup END
