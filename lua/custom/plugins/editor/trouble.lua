return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'Trouble' },
  opts = {
    modes = {
      lsp = {
        win = { position = 'right' },
      },
    },
  },
  keys = {
    { '<leader>oD', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Tr[o]uble [D]iagnostics' },
    { '<leader>od', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Tr[o]uble Buffer [d]iagnostics' },
    { '<leader>oS', '<cmd>Trouble lsp toggle<cr>', desc = 'Tr[o]uble L[S]P references/definitions/...' },
    { '<leader>os', '<cmd>Trouble symbols toggle<cr>', desc = 'Tr[o]uble [s]ymbols' },
    { '<leader>oL', '<cmd>Trouble loclist toggle<cr>', desc = 'Tr[o]uble [L]ocation List' },
    { '<leader>oQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Tr[o]uble [Q]uickfix List' },
    {
      '[q',
      function()
        if require('trouble').is_open() then
          require('trouble').prev { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Previous Trouble/Quickfix Item',
    },
    {
      ']q',
      function()
        if require('trouble').is_open() then
          require('trouble').next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Next Trouble/Quickfix Item',
    },
  },
}
