return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },

  cmd = 'Neotree',
  keys = {
    {
      '<leader>nt',
      function()
        require('neo-tree.command').execute { toggle = true }
      end,
      desc = '[N]eotree [T]oggle',
    },
    {
      '<leader>nf',
      function()
        require('neo-tree.command').execute { action = 'focus' }
      end,
      desc = '[N]eotree [F]ocus',
    },
    {
      '<leader>ns',
      function()
        require('neo-tree.command').execute { toggle = 'show' }
      end,
      desc = '[N]eotree [S]how',
    },
    {
      '<leader>nc',
      function()
        require('neo-tree.command').execute { toggle = 'close' }
      end,
      desc = '[N]eotree [C]lose',
    },
  },

  init = function()
    -- Auto open neotree if opening neovim in a directory
    if vim.fn.argc(-1) == 1 then
      arg = vim.fn.argv(0)
      if type(arg) ~= 'string' then
        return
      end
      local stat = vim.uv.fs_stat(arg)
      if stat and stat.type == 'directory' then
        require 'neo-tree'
      end
    end
  end,

  opts = {
    sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        -- visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        always_show = {
          '.gitignore',
        },
      },
    },
    window = {
      mappings = {
        ['<space>'] = 'none',
        ['Y'] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg('+', path, { 'c' })
          end,
          desc = 'Copy Path to Clipboard',
        },
      },
      width = 30, -- default: 40
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
      git_status = {
        symbols = {
          added = '',
          modified = '',
          -- or "✚" and "", but this is redundant info if you use git_status_colors on the name
        },
      },
    },
  },

  config = function(_, opts)
    require('neo-tree').setup(opts)
  end,
}
