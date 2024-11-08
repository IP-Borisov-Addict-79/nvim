-- src: https://github.com/exu/pgsql.vim.git
return {
    'exu/pgsql.vim',
    name = 'psql-vim',
    config = function()
        -- set default SQL syntax to postgresql
        vim.g['sql_type_default'] = 'pgsql'
    end
}
