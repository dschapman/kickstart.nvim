return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  ft = { 'tex', 'plaintex', 'bib' },
  init = function()
    -- PDF viewer configuration (use 'skim' on macOS for better integration)
    vim.g.vimtex_view_method = 'skim' -- or 'zathura' if you prefer

    -- Skim settings for forward/backward search
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 1

    -- Compiler settings
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      build_dir = '',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      options = {
        '-pdf',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }

    -- Improved syntax concealment for better preview
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 1,
      fancy = 1,
      spacing = 1,
      greek = 1,
      math_bounds = 0,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      math_symbols = 1,
      sections = 0,
      styles = 1,
    }

    -- Quickfix auto-open
    vim.g.vimtex_quickfix_mode = 2 -- Open but don't auto-focus

    -- Disable some less useful features for performance
    vim.g.vimtex_indent_enabled = 1
    vim.g.vimtex_imaps_enabled = 1
    vim.g.vimtex_complete_enabled = 1

    -- Table of contents configuration
    vim.g.vimtex_toc_config = {
      name = 'TOC',
      layers = { 'content', 'todo', 'include' },
      split_width = 30,
      todo_sorted = 0,
      show_help = 1,
      show_numbers = 1,
    }
  end,
}
