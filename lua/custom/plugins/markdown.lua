return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {},
    config = function()
      require('render-markdown').setup {
        -- Enable rendering when entering buffer
        render_modes = { 'n', 'c' },

        -- LaTeX rendering configuration
        latex = {
          enabled = true,
          converter = 'utftex', -- Using installed utftex converter
          highlight = 'RenderMarkdownMath',
        },

        -- Code blocks
        code = {
          enabled = true,
          sign = true,
          style = 'full',
          position = 'left',
          width = 'block',
          left_pad = 2,
          right_pad = 2,
        },

        -- Headings
        heading = {
          enabled = true,
          sign = true,
          icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        },

        -- Better list rendering
        bullet = {
          enabled = true,
          icons = { '●', '○', '◆', '◇' },
        },

        -- Conceal inline code and links for cleaner view
        pipe_table = {
          enabled = true,
          style = 'full',
        },
      }
    end,
  },
}
