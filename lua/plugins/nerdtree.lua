return {
    'preservim/nerdtree',
    name = 'NERDTree',
    config = function()
        vim.g.NERDTreeWinSize   = 32  -- change default NERDTree width
        vim.g.NERDTreeMinimalUI =  1  -- don't show help string
        vim.opt.hidden = true         -- prevent NERDtree from splitting window on opening a new file

        -- a wrapper for NERDTreeToggle
        vim.cmd(
            [[
                function! NERDTag()
                    call system('make clean') " clean shite left from previous session
                    NERDTreeToggle
                endfunction
                command NTag call NERDTag()
            ]]
        )
    end
}
