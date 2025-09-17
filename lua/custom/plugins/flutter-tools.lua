return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('flutter-tools').setup {
      lsp = {
        on_attach = function(_, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }

          -- Show hover
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          -- Jump to definition
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          -- Open code actions
          vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
      },
    }
  end,
}
