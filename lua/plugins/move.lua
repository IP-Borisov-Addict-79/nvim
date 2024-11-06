return {
    'matze/vim-move',
    name = 'move',
    priority = 1000,
    config = function()
        vim.g.move_key_modifier = 'M' -- set modifier key to alt
    end
}
