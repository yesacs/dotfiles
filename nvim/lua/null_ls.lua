-- null-ls setup
local null_ls = require("null-ls")

null_ls.setup({
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      end
    end,
    sources = {
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.diagnostics.vint,
      null_ls.builtins.formatting.fish_indent,
      null_ls.builtins.formatting.lua_format,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.stylelint,  
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.refactoring,
      null_ls.builtins.completion.spell,
    },
})
