return {
  -- Comments (replaces Comment.nvim)
  'echasnovski/mini.comment',
  event = 'VeryLazy',
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  config = function()
    -- See: https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations
    require('ts_context_commentstring').setup {
      enable_autocmd = false,
    }
    require('mini.comment').setup {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    }
  end,
}
