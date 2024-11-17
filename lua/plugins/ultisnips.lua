return {
    'SirVer/ultisnips',
    name = 'UltiSnips',
    config = function()
        -- trigger configuration
        vim.g['UltiSnipsExpandTrigger']       = '<tab>'
        vim.g['UltiSnipsJumpForwardTrigger']  = '<M-f>'
        vim.g['UltiSnipsJumpBackwardTrigger'] = '<M-b>'
    end
}
