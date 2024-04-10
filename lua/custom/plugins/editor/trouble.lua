return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'TroubleToggle', 'Trouble' },
  keys = {
    { '<leader>tf', '<cmd>Trouble<cr>', desc = '[T]rouble [F]ocus' },
    { '<leader>tt', '<cmd>TroubleToggle<cr>', desc = '[T]rouble [T]oggle' },
    { '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = '[T]rouble [W]orkspace' },
    { '<leader>td', '<cmd>TroubleToggle document_diagnostics<cr>', desc = '[T]rouble [D]ocument' },
    { '<leader>tq', '<cmd>TroubleToggle quickfix<cr>', desc = '[T]rouble [Q]uickfix' },
    { '<leader>tl', '<cmd>TroubleToggle loclist<cr>', desc = '[T]rouble [L]oclist' },
    { '<leader>tr', '<cmd>TroubleToggle lsp_references<cr>', desc = '[T]rouble LSP [R]eferences' },
  },
  opts = { use_diagnostic_signs = true },
}
