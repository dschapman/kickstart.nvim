return {
  {
    'idossha/matlab.nvim',
    ft = 'matlab',
    config = function()
      require('matlab').setup {
        executable = 'matlab',
        auto_start = true,
        default_mappings = true,
      }

      vim.keymap.set('n', '<leader>ms', '<cmd>MatlabStartServer<cr>', { desc = '[M]atlab [S]tart server' })
    end,
  },
}
