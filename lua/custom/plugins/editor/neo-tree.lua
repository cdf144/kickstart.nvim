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
        require('neo-tree.command').execute { action = 'show' }
      end,
      desc = '[N]eotree [S]how',
    },
    {
      '<leader>nc',
      function()
        require('neo-tree.command').execute { action = 'close' }
      end,
      desc = '[N]eotree [C]lose',
    },
  },

  init = function()
    -- Auto open neotree if opening neovim in a directory
    -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
    -- because `cwd` is not set up properly.
    vim.api.nvim_create_autocmd('BufEnter', {
      group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
      desc = 'Start Neo-tree with directory',
      once = true,
      callback = function()
        if package.loaded['neo-tree'] then
          return
        else
          local stats = vim.uv.fs_stat(vim.fn.argv(0))
          if stats and stats.type == 'directory' then
            require 'neo-tree'
          end
        end
      end,
    })
  end,

  opts = {
    sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
        always_show = {
          '.gitignore',
          'logs',
        },
        always_show_by_pattern = {
          '.env*',
          '*.log',
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
            vim.fn.setreg('+', path, 'c')
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
