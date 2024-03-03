local null_ls = require 'null-ls'

local opts = {
  sources = {
    -- null_ls.builtins.diagnostics.mypy,
    -- null_ls.builtins.diagnostics.markdownlint,
    -- null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.djlint,
    -- null_ls.builtins.formatting.black,
  },
}

return opts
