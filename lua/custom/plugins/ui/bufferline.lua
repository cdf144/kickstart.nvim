return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      options = {
        hover = {
          enabled = true,
          delay = 20,
          reveal = { 'close' },
        },
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Tree',
            text_align = 'center',
            separator = true,
          },
        },
        separator_style = 'slant',
      },
    }
  end,
}
