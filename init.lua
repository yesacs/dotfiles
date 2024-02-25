return {
  heirline = {
    attributes = {
      buffer_active = { bold = true, italic = true },
      buffer_picker = { bold = true },
      macro_recording = { bold = true },
      git_branch = { bold = true },
      git_diff = { bold = true },
      file_info = { bold = true },
    }
  },
  options = {
    opt = {
      showtabline = 0
    }
  },
  plugins = {
    'ggandor/leap.nvim',
    'jpalardy/vim-slime',
    'michaelb/sniprun',
    {
      "jay-babu/mason-null-ls.nvim",
      opts = {
        handlers = {
          prettier = function()
            require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
              condition = function(utils)
                return utils.root_has_file "package.json"
                    or utils.root_has_file ".prettierrc"
                    or utils.root_has_file ".prettierrc.json"
                    or utils.root_has_file ".prettierrc.js"
              end,
            })
          end,
        },
      }
    },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require("astronvim.utils.status")
        opts.statusline = {             -- statusline
          hl = { fg = "fg", bg = "bg" },
          status.component.mode(),      -- { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
          status.component.git_branch(),
          status.component.file_info(), -- { filetype = {}, filename = false, file_modified = false },
          status.component.git_diff(),
          status.component.diagnostics(),
          status.component.fill(),
          status.component.cmd_info(),
          status.component.fill(),
          status.component.lsp(),
          status.component.treesitter(),
          status.component.nav(),
          -- remove the 2nd mode indicator on the right
        }

        -- return the final configuration table
        return opts
      end,
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup()
      end
    },
  }
}
