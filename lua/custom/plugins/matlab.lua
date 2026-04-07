return {
  {
    'Vigemus/iron.nvim',
    ft = { 'matlab', 'octave' },
    init = function()
      vim.filetype.add {
        extension = {
          m = 'matlab',
        },
      }
    end,
    config = function()
      local iron = require 'iron.core'
      local view = require 'iron.view'
      local ok_which_key, which_key = pcall(require, 'which-key')

      local function matlab_app_path()
        local install_path = vim.env.MATLAB_HOME
        if install_path and install_path ~= '' then
          return install_path
        end

        local matlab_apps = vim.fn.glob('/Applications/MATLAB*.app', false, true)
        table.sort(matlab_apps)
        return matlab_apps[#matlab_apps]
      end

      local function matlab_command()
        local matlab = vim.fn.exepath 'matlab'
        if matlab ~= '' then
          return { matlab, '-nosplash', '-nodesktop' }
        end

        local app_path = matlab_app_path()
        if app_path and app_path ~= '' then
          return { app_path .. '/bin/matlab', '-nosplash', '-nodesktop' }
        end

        local octave = vim.fn.exepath 'octave'
        if octave ~= '' then
          return { octave, '--interactive', '--quiet' }
        end

        return { 'matlab', '-nosplash', '-nodesktop' }
      end

      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            matlab = {
              command = matlab_command,
              block_dividers = { '%%' },
            },
            octave = {
              command = matlab_command,
              block_dividers = { '%%' },
            },
          },
          repl_filetype = function(_, ft)
            return ft
          end,
          repl_open_cmd = {
            view.split.rightbelow(0.35),
            view.split.vertical.botright(0.42),
          },
        },
        keymaps = {
          toggle_repl = '<leader>mr',
          send_motion = '<leader>ms',
          visual_send = '<leader>ms',
          send_file = '<leader>mf',
          send_line = '<leader>ml',
          interrupt = '<leader>mi',
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true,
      }

      if ok_which_key then
        which_key.add {
          { '<leader>m', group = '[M]ATLAB' },
        }
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('custom-matlab-keymaps', { clear = true }),
        pattern = { 'matlab', 'octave' },
        callback = function(event)
          vim.keymap.set('n', '<leader>mc', function()
            iron.send_code_block(false)
          end, {
            buffer = event.buf,
            desc = 'Send MATLAB cell',
            silent = true,
          })

          vim.keymap.set('n', '<leader>mn', function()
            iron.send_code_block(true)
          end, {
            buffer = event.buf,
            desc = 'Send MATLAB cell and move',
            silent = true,
          })
        end,
      })
    end,
  },
}
