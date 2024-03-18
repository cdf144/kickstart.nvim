return {
  -- Code folding
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'VeryLazy',
  init = function()
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
  end,
  config = function()
    require('ufo').setup {
      -- Uncomment to use treesitter as main provider and skip lsp
      -- ---@diagnostic disable-next-line: unused-local
      -- provider_selector = function(bufnr, filetype, buftype)
      --   return { 'treesitter', 'indent' }
      -- end,
    }
    -- Uncomment to enable fold icons on the columnline
    -- vim.o.foldcolumn = '1'
    -- vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:⏵]]
    -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  end,
}
