return {
  'akinsho/bufferline.nvim',
  commit = vim.fn.has 'nvim-0.10' == 0 and '73540cb95f8d95aa1af3ed57713c6720c78af915' or nil,
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      ---@diagnostic disable-next-line: unused-local
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icons = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
        local ret = (diagnostics_dict.error and icons.Error .. diagnostics_dict.error .. ' ' or '')
          .. (diagnostics_dict.warning and icons.Warn .. diagnostics_dict.warning or '')
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
      hover = {
        enabled = true,
        delay = 20,
        reveal = { 'close' },
      },
      separator_style = 'slant',
      numbers = function(opts)
        return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
      end,
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
