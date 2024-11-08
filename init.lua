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

-- Insert 4 spaces instead of Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Show Tab characters
vim.opt.listchars:append{ tab = '>>' }
vim.opt.list = true

-- Set lower priority for some files during Tab completion
vim.opt.suffixes= [[.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc]]

-- Syntax highlighting
if vim.fn.has('syntax') then
    vim.opt.syntax = 'on'
end

-- Fortran-90+ settings
vim.g.fortran_free_source = 1
vim.g.fortran_have_tabs = 0
vim.g.fortran_more_precise = 1
vim.g.fortran_do_enddo = 1

-- set default SQL syntax to postgresql
-- src: https://github.com/exu/pgsql.vim.git
if vim.fn.filereadable('~/.config/nvim/syntax/pgsql.vim') then
    vim.g['sql_type_default'] = 'pgsql'
end

-- Jump to the last position when reopening a file
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

-- Vim inner layout switch (mapped to Alt-Space, change shortcut in Mate/Xfce4!!!)
vim.opt.keymap = 'russian-jcukenwin'      -- russian Win-like layout
vim.opt.iminsert = 0                      -- latin by default in insert mode
vim.opt.imsearch = 0                      -- latin by default in search string
vim.keymap.set('i', '<M-Space>', '<C-^>') -- insert mode
vim.keymap.set('c', '<M-Space>', '<C-^>') -- search

-- duplicate current string, could be handy
vim.keymap.set('', '<C-L>', ':t.<CR>', { noremap = true, silent = true })

-- Plugins
require("lazyboot")              -- bootstrap LazyVim (lua/lazyboot.lua)
require("lazy").setup("plugins") -- manage plugins    (lua/{plugins.lua, plugins})
