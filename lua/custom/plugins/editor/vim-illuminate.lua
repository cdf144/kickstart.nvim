return {
  'RRethy/vim-illuminate',
  event = {
    'BufReadPost',
    'BufNewFile',
    'BufWritePre',
  },
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { 'lsp' },
    },
  },
  config = function(_, opts)
    require('illuminate').configure(opts)

    local function map(key, dir, buffer)
      vim.keymap.set('n', key, function()
        -- For example: require('illuminate').goto_next_reference(wrap=false)
        require('illuminate')['goto_' .. dir .. '_reference'](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
    end

    map('[[', 'prev')
    map(']]', 'next')

    -- Also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map('[[', 'prev', buffer)
        map(']]', 'next', buffer)
      end,
    })
  end,
  keys = {
    { '[[', desc = 'Prev Reference' },
    { ']]', desc = 'Next Reference' },
  },
}
