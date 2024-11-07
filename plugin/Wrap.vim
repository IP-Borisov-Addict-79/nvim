" set word wrap mode
function _Wrap()
    set wrap nolist
    "
    " remember current textwidth state and unset the option
    let g:cur_textwidth=&textwidth
    set textwidth=0
    "
    set linebreak
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap $ g$
    nnoremap <S-a> g$a
    vnoremap j gj
    vnoremap k gk
    vnoremap 0 g0
    vnoremap $ g$
    vnoremap <S-a> g$a
endfunction

" unset word wrap mode
function _NoWrap()
    set nowrap linebreak
    if exists('g:cur_textwidth')
        " restore original textwidth
        let &textwidth=g:cur_textwidth
        unlet g:cur_textwidth
    endif
    nnoremap j j
    nnoremap k k
    nnoremap 0 0
    nnoremap $ $
    nnoremap <S-a> <S-a>
    vnoremap j j
    vnoremap k k
    vnoremap 0 0
    vnoremap $ $
    vnoremap <S-a> <S-a>
endfunction

" user-friendly wrapper commands
command Wrap call _Wrap()
command NoWrap call _NoWrap()
