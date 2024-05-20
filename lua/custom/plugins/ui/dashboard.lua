return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },

  opts = function()
    local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

    logo = string.rep('\n', 4) .. logo .. '\n\n'

    local opts = {
      theme = 'doom',
      hide = {
        -- This is taken care of by lualine
        statusline = false,
      },
      config = {
        header = vim.split(logo, '\n'),

        -- stylua: ignore
        center = {
          { action = "Telescope find_files",    desc = " Find File",      icon = " ", key = "f" },
          { action = "ene | startinsert",       desc = " New File",       icon = " ", key = "n" },
          { action = "Telescope oldfiles",      desc = " Recent Files",   icon = " ", key = "r" },
          { action = "Telescope live_grep",     desc = " Find Text",      icon = " ", key = "g" },
          { action = "Neotree ~/.config/nvim",  desc = " Config",         icon = " ", key = "c" },
          { action = "Lazy",                    desc = " Lazy",           icon = "󰒲 ", key = "l" },
          { action = "qa",                      desc = " Quit",           icon = " ", key = "q" },
        },

        footer = function()
          local stats = require('lazy').stats()
          -- Round to 2 decimal places
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }

    -- Format buttons
    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DashboardLoaded',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    return opts
  end,
}
