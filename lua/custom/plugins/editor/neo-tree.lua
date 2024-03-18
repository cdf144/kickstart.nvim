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
  config = function()
    require('neo-tree').setup {
      default_component_configs = {
        git_status = {
          symbols = {
            added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
          },
        },
      },

      window = {
        width = 30, -- default: 40
      },

      filesystem = {
        filtered_items = {
          -- visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          always_show = {
            '.gitignore',
          },
        },
      },
    }
  end,
}
