return {
  'linux-cultist/venv-selector.nvim',
  branch = 'regexp', -- Use this branch for the new version
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'VenvSelect',
  opts = {
    settings = {
      options = {
        notify_user_on_venv_activation = true,
      },
    },
  },
  --  Call config for python files and load the cached venv automatically
  ft = 'python',
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>vs', '<cmd>VenvSelect<cr>', desc = '[V]env [S]elect' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>vc', '<cmd>VenvSelectCached<cr>', desc = '[V]env Select [C]ached' },
  },
}
