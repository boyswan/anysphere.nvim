# Anysphere.nvim

Neovim colorscheme based on the Cursor Anysphere theme.

This theme uses the same color values as the Cursor Anysphere VS Code theme
from `https://github.com/hasokeric/cursor-anysphere-theme`, translated for
Neovim core UI, syntax, Tree-sitter, LSP semantic tokens, diagnostics, diffs,
terminal colors, and common plugin highlight groups.

VS Code TextMate scopes and Neovim highlight groups are not identical systems,
so the port maps equivalent groups where Neovim exposes them. Source colors
with alpha channels are resolved against the Anysphere editor background because
Neovim highlights use opaque RGB colors.

## Installation

### lazy.nvim

```lua
{
  "yourname/anysphere-nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("anysphere").setup({
      bold_functions = true,
      italic_comments = true,
      italic_keywords = true,
      terminal_colors = true,
      transparent = false,
    })

    vim.cmd.colorscheme("anysphere")
  end,
}
```

### LazyVim

Add this to `lua/plugins/anysphere.lua`:

```lua
return {
  {
    "yourname/anysphere-nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bold_functions = true,
      italic_comments = true,
      italic_keywords = true,
      terminal_colors = true,
      transparent = false,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "anysphere",
    },
  },
}
```

### packer.nvim

```lua
use({
  "yourname/anysphere-nvim",
  config = function()
    vim.cmd.colorscheme("anysphere")
  end,
})
```

## Usage

```lua
require("anysphere").setup()

vim.cmd.colorscheme("anysphere")
```

## Audit

If the Cursor source theme is checked out beside this plugin, compare the color
sets with:

```sh
sh scripts/audit-colors.sh cursor-anysphere-theme/themes/anysphere-theme.json
```
