-- This file contains the configuration for various UI-related plugins in Neovim.
return {
  -- Plugin: folke/todo-comments.nvim
  -- URL: https://github.com/folke/todo-comments.nvim
  -- Description: Plugin to highlight and search for TODO, FIX, HACK, etc. comments in your code.
  -- IMPORTANT: using version "*" to fix a bug

  {
    "folke/todo-comments.nvim",
  },

  -- Plugin: folke/which-key.nvim
  -- URL: https://github.com/folke/which-key.nvim
  -- Description: Plugin to show a popup with available keybindings.
  -- IMPORTANT: using event "VeryLazy" to optimize loading time
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "classic",
      win = { border = "single" },
    },
  },

  -- Plugin: noice.nvim
  -- URL: https://github.com/folke/noice.nvim
  -- Description: A Neovim plugin for enhancing the command-line UI.

  -- Description: A Neovim plugin for enhancing the command-line UI.

  -- Plugin: nvim-docs-view
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        cmdline = {
          view = "cmdline", -- Usa la vista cmdline para la línea de comandos
        },
        presets = {
          bottom_search = true, -- Habilita la vista de búsqueda en la parte inferior
          command_palette = true, -- Habilita la vista de paleta de comandos
          lsp_doc_border = true, -- Habilita el borde de la documentación LSP
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "completion request failed", -- Bloquea este mensaje específico
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "codeium", -- Filtra cualquier mensaje que contenga "Codeium"
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "unavailable", -- Filtra cualquier mensaje relacionado con "unavailable" o "connection reset"
            },
            opts = { skip = true },
          },
        },
      })
    end,
  },
  -- URL: https://github.com/amrbashir/nvim-docs-view
  -- Description: A Neovim plugin for viewing documentation.
  {
    "amrbashir/nvim-docs-view",
    lazy = true, -- Load this plugin lazily
    cmd = "DocsViewToggle", -- Command to toggle the documentation view
    opts = {
      position = "right", -- Position the documentation view on the right
      width = 60, -- Set the width of the documentation view
    },
  },

  -- Plugin: lualine.nvim
  -- URL: https://github.com/nvim-lualine/lualine.nvim
  -- Description: A blazing fast and easy to configure Neovim statusline plugin.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
    requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency for icons
    opts = {
      options = {
        theme = "molokai", -- Set the theme for lualine
        icons_enabled = true, -- Enable icons in the statusline
      },
      sections = {
        lualine_a = {
          {
            "mode", -- Display the current mode
            icon = "󱗞", -- Set the icon for the mode
          },
        },
      },
    },
  },

  -- Plugin: incline.nvim
  -- URL: https://github.com/b0o/incline.nvim
  -- Description: A Neovim plugin for showing the current filename in a floating window.
  {
    "b0o/incline.nvim",
    event = "BufReadPre", -- Load this plugin before reading a buffer
    priority = 1200, -- Set the priority for loading this plugin
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } }, -- Set the window margin
        hide = {
          cursorline = true, -- Hide the incline window when the cursorline is active
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t") -- Get the filename
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename -- Indicate if the file is modified
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename) -- Get the icon and color for the file
          return { { icon, guifg = color }, { " " }, { filename } } -- Return the rendered content
        end,
      })
    end,
  },

  -- Plugin: mini.nvim
  -- URL: https://github.com/echasnovski/mini.nvim
  -- Description: A collection of minimal, fast, and modular Lua plugins for Neovim.
  {
    "echasnovski/mini.nvim",
    version = false, -- Use the latest version
    config = function()
      require("mini.animate").setup({
        resize = {
          enable = false, -- Disable resize animations
        },
        open = {
          enable = false, -- Disable open animations
        },
        close = {
          enable = false, -- Disable close animations
        },
        scroll = {
          enable = false, -- Disable scroll animations
        },
      })
    end,
  },

  -- Plugin: zen-mode.nvim
  -- URL: https://github.com/folke/zen-mode.nvim
  -- Description: A Neovim plugin for distraction-free coding.
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode", -- Command to toggle Zen Mode
    opts = {
      plugins = {
        gitsigns = true, -- Enable gitsigns integration
        tmux = true, -- Enable tmux integration
        kitty = { enabled = false, font = "+2" }, -- Disable kitty integration and set font size
        twilight = { enabled = true }, -- Enable twilight integration
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } }, -- Keybinding to toggle Zen Mode
  },

  -- Plugin: snacks.nvim
  -- URL: https://github.com/folke/snacks.nvim/tree/main
  -- Description: A Neovim plugin for creating a customizable dashboard.
  {
    "folke/snacks.nvim",
    opts = {
      image = {},
      picker = {
        matcher = {
          fuzzy = true,
          smartcase = true,
          ignorecase = true,
          filename_bonus = true,
        },
        sources = {
          explorer = {
            matcher = {
              fuzzy = true, -- Enables fuzzy matching, so you can be a bit imprecise with your search terms
              smartcase = true, -- If your search term has uppercase letters, the search becomes case-sensitive
              ignorecase = true, -- Ignores case when searching, unless smartcase is triggered
              filename_bonus = true, -- Gives a higher priority to matches in filenames
              sort_empty = false, -- If no matches are found, it won't sort the results
            },
          },
        },
      },
      dashboard = {
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          header = [[
                    ░░░░░░      ░░░░░░                        
                  ░░░░░░░░░░  ░░░░░░░░░░                      
                ░░░░░░░░░░░░░░░░░░░░░░░░░░                    
              ░░░░░░░░░░▒▒▒▒░░▒▒▒▒░░░░░░░░░░                  
  ░░░░      ░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░        ░░░░    
▒▒░░      ░░░░░░▒▒▒▒▒▒▒▒▒▒██▒▒██▒▒▒▒▒▒▒▒▒▒░░░░░░        ▒▒░░  
▒▒░░    ░░░░░░░░▒▒▒▒▒▒▒▒▒▒████▒▒████▒▒▒▒▒▒▒▒▒▒░░░░░░░░  ▒▒░░▒ 
▒▒▒▒░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒ 
██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒██████▓▓██▒▒██████▒▒▓▓██▒▒▒▒▒▒▒▒▒▒▒▒▒▒█ 
████▒▒▒▒▒▒████▒▒▒▒██████████  ██████████▒▒▒▒████▒▒▒▒▒▒▒▒██    
  ████████████████████████      ████████████████████████      
    ██████████████████              ██████████████████        
        ██████████                      ██████████            
]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
