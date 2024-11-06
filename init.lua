-- Contains functions, hot-reloading DOES NOT WORK!!!

-- Initial configuration (basically a trimmed copy of old init.vim)
vim.opt.backspace = [[indent,eol,start]] -- more powerful backspacing
vim.opt.history = 50                     -- keep 50 lines of command line history
vim.opt.ruler = true                     -- show the cursor position all the time
vim.opt.showmatch = true                 -- show matching brackets
vim.opt.incsearch = true                 -- incremental search
vim.opt.mouse = 'a'                      -- enable mouse for all modes
vim.opt.swapfile = false                 -- turn off swap
vim.opt.backup = false                   -- turn off backup files
vim.opt.wrap = false                     -- turn off lines wrapping
vim.opt.number = true                    -- line numbering
vim.opt.scrolloff = 4                    -- distance between cursor and top/bottom of a buffer

-- insert 4 spaces instead of Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- show Tabs characters
vim.opt.list = true
vim.opt.listchars:append{ tab = '>>' }

-- set lower priority for some files during Tab completion
vim.opt.suffixes= [[.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc]]

-- syntax highlighting
if vim.fn.has('syntax') then
    vim.opt.syntax = 'on'
end
-- load indentation rules and plugins according to the detected filetype

-- Fortran-90+ settings
vim.g.fortran_free_source = 1
vim.g.fortran_have_tabs = 0
vim.g.fortran_more_precise = 1
vim.g.fortran_do_enddo = 1

-- jump to the last position when reopening a file
if vim.fn.has('autocmd') then
    vim.cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]])
end
 
-- turn off arrow keys in normal and insert modes
vim.keymap.set('n',  '<Up>',    '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n',  '<Down>',  '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n',  '<Left>',  '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n',  '<Right>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i',  '<Up>',    '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i',  '<Down>',  '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i',  '<Left>',  '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i',  '<Right>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('v',  '<Up>',    '<NOP>', { noremap = true, silent = true })
vim.keymap.set('v',  '<Down>',  '<NOP>', { noremap = true, silent = true })
vim.keymap.set('v',  '<Left>',  '<NOP>', { noremap = true, silent = true })
vim.keymap.set('v',  '<Right>', '<NOP>', { noremap = true, silent = true })

-- Vim inner layout switch
vim.opt.keymap = 'russian-jcukenwin' -- Remap layout switching to Alt-Space (change desktop shortcut in Mate/Xfce4!)
vim.opt.iminsert = 0                 -- latin by default in insert mode
vim.opt.imsearch = 0                 -- latin by default in search string
vim.keymap.set('i', '<M-Space>', '<C-^>') -- insert mode
vim.keymap.set('c', '<M-Space>', '<C-^>') -- search

-- duplicate current string, could be handy
vim.keymap.set('', '<C-L>', ':t.<CR>', { noremap = true, silent = true })

-- Encodings menu (mapped to F7)
vim.cmd(
    [[
        menu Encoding.cp1251 :e ++enc=cp1251 ++ff=dos<CR>
        menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
        menu Encoding.cp866  :e ++enc=cp866 ++ff=dos<CR>
        menu Encoding.utf-8  :e ++enc=utf8<CR>
    ]]
)
vim.keymap.set('', '<F7>', ':emenu Encoding.')

-- Text wrap mode
vim.cmd(
    [[
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
    ]]
)

-----------------------------------------------------------------------------
--  old plugins, some should go in essentials (colorscheme, BufExplorer)   --
-----------------------------------------------------------------------------

-- colorscheme, visual highlighting of current line
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd([[ colorscheme darcula ]])
vim.g.lightline = { colorscheme = 'darculaOriginal' }
vim.opt.cursorlineopt = { 'number', 'screenline' }
vim.opt.cursorline = true

-- BufExplorer on Ctrl-b and some tweaks
if vim.fn.filereadable('~/.config/nvim/plugin/bufexplorer.vim') then
    vim.keymap.set('n', '<C-b>', ':BufExplorerHorizontalSplit<CR>', { noremap = true, silent = true })
    vim.g.bufExplorerDefaultHelp = 0 -- do not show default help
    vim.g.bufExplorerSplitBelow  = 1 -- split below current window
end

-- pandoc markdown support. Requires vim-pandoc-syntax:
-- https://github.com/vim-pandoc/vim-pandoc-syntax
-- prevent XTRMLY annoying pandoc-markdown rendering
if vim.fn.filereadable('~/.config/nvim/plugin/pandoc-syntax-check.vim') then
    vim.g['pandoc#syntax#conceal#use'] = 0
end

-- move plugin - move (selected) lines and blocks up&down (with Alt-[hjkl])
if vim.fn.filereadable('~/.config/nvim/plugin/move.vim') then
    vim.g.move_key_modifier = 'M' -- set modifier key to alt
end

--  old version of NERDTree plugin with some tweaks (with killed tagbar)
if vim.fn.filereadable('~/.config/nvim/plugin/NERD_tree.vim') then
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
