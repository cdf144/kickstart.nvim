-- Unless you are still migrating, remove the deprecated commands from v1.x
-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy', -- Able to use `:Neotree` command without a keymapping
  keys = {
    -- Keymap to toggle Neotree
    { '<leader>nt', '<cmd>Neotree toggle<cr>', 'Toggle Neotree' },
    -- Keymap to focus Neotree
    { '<leader>nf', '<cmd>Neotree focus<cr>', 'Focus Neotree' },
  },
  config = function()
    require('neo-tree').setup {}
  end,
}
