return {
    'jlanzarotta/bufexplorer',
    name = 'bufexplorer',
    priority = 1000,
    config = function()
        vim.keymap.set('n', '<C-b>', ':BufExplorerHorizontalSplit<CR>', { noremap = true, silent = true })
        vim.g.bufExplorerDefaultHelp = 0 -- do not show default help
        vim.g.bufExplorerSplitBelow  = 1 -- split below current window
    end
}
