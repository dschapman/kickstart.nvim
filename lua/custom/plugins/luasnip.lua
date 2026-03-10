return {
  {
    'L3MON4D3/LuaSnip',
    opts = function(_, opts)
      opts = opts or {}

      local ls = require 'luasnip'
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node

      ls.add_snippets('matlab', {
        s('mheader', {
          t '% Filename:',
          i(1, 'Filename'),
          t { '', '% Purpose: ' },
          i(2, 'Purpose'),
          t { '', '% Created by: Daniel Chapman', '% Created on: ' },
          f(function()
            return os.date '%Y-%m-%d'
          end, {}),
          t { '', '' },
        }),
      })

      return opts
    end,
  },
}
