return {
  -- Visualize indent scopes (replaces indent-blankline.nvim scope function)
  'echasnovski/mini.indentscope',
  event = {
    'BufReadPost',
    'BufNewFile',
    'BufWritePre',
  },
  opts = {
    -- symbol = "▏",
    symbol = '▎',
    options = { try_as_border = true },
    draw = {
      delay = 50,
      animation = function(s, n)
        return 10
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'trouble',
        'lazy',
        'mason',
        'notify',
        'toggleterm',
        'lazyterm',
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
