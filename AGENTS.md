# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Project Overview

This is a Neovim configuration based on kickstart.nvim - a well-documented, minimal starting point for Neovim that focuses on being educational rather than a full distribution. The configuration is primarily contained in a single `init.lua` file with additional custom plugins in the `lua/custom/plugins/` directory.

## Key Architecture

- **Single-file approach**: Main configuration is in `init.lua` following kickstart.nvim's educational philosophy
- **Plugin management**: Uses lazy.nvim for plugin management with lazy loading
- **Modular extensions**: Custom plugins are added via `lua/custom/plugins/*.lua` files
- **LSP integration**: Configured with Mason for automatic LSP server installation and management

## Essential Commands

### Plugin Management

- `:Lazy` - View plugin status and manage plugins
- `:Lazy update` - Update all plugins
- `:Mason` - Manage LSP servers, formatters, and linters
- Press `g?` in Mason for help

### Health Checks

- `:checkhealth` - Run health checks for Neovim and plugins
- `:checkhealth kickstart` - Run kickstart-specific health checks

### Key Dependencies Required

- `git`, `make`, `unzip`, `rg` (ripgrep)
- C compiler (gcc)
- Optional: Nerd Font (set `vim.g.have_nerd_font = true` in init.lua:8)

## Configuration Structure

### Core Components

- **Options**: Basic Neovim settings (lines 10-79)
- **Keymaps**: Custom key mappings (lines 81-118)
- **Autocommands**: Automated behaviors (lines 120-132)
- **Plugin setup**: Lazy.nvim configuration and plugin definitions (lines 134-931)

### Key Plugins Configured

- **Telescope**: Fuzzy finder with extensive keybindings under `<leader>s`
- **LSP**: Language server support with Mason auto-installation
- **Treesitter**: Syntax highlighting and parsing
- **Blink.cmp**: Autocompletion with LSP integration
- **Conform**: Code formatting
- **Gitsigns**: Git integration
- **Oil**: File manager (custom plugin, mapped to `-`)

### Custom Plugins

Located in `lua/custom/plugins/`:

- `oil.lua`: File manager plugin with `-` keymap for parent directory navigation

## Development Workflow

### Adding New Plugins

1. Create new `.lua` file in `lua/custom/plugins/`
2. Return plugin specification table following lazy.nvim format
3. Restart Neovim or run `:Lazy reload`

### LSP Configuration

- New language servers can be added to the `servers` table in init.lua:587
- Mason will automatically install configured servers
- Custom LSP settings go in the servers table

### Formatting

- Formatters configured in `formatters_by_ft` table (init.lua:684)
- Format with `<leader>f` or automatic on save (configurable per filetype)

## Important Notes

- Configuration targets latest stable/nightly Neovim (0.10+)
- Leader key is set to space (`<leader>` = space)
- Nerd Font detection affects icon display throughout the config
- The configuration includes Swift LSP support (sourcekit) configured on line 438
