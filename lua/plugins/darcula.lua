-- darcula theme setup
return {
    'doums/darcula',
    name = 'darcula',
    priority = 1000,
    config = function()
        vim.opt.background = 'dark'
        vim.opt.termguicolors = true
        vim.cmd([[ colorscheme darcula ]])
        vim.g.lightline = { colorscheme = 'darculaOriginal' }
        vim.opt.cursorlineopt = { 'number', 'screenline' }
        vim.opt.cursorline = true
    end
}
