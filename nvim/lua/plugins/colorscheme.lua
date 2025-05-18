return {
  {
    {
      "dgox16/oldworld.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("oldworld").setup({
          terminal_colors = true,
          variant = "oled",
          styles = {
            booleans = { italic = true, bold = true },
          },
          integrations = {
            alpha = true,
            cmp = true,
            flash = true,
            gitsigns = true,
            hop = true, -- activado
            indent_blankline = true,
            lazy = true,
            lsp = true,
            markdown = true,
            mason = true,
            navic = false,
            neo_tree = false,
            neogit = false,
            neorg = false,
            noice = true,
            notify = true,
            rainbow_delimiters = true,
            telescope = false, -- desactivado
            treesitter = true,
          },
          highlight_overrides = {
            Comment = { bg = "#ff0000" },
          },
        })
      end,
    },
    {
      "olimorris/onedarkpro.nvim",
      priority = 1000, -- Se carga antes que otros plugins
      lazy = false, -- Se carga al inicio
      config = function()
        require("onedarkpro").setup({
          highlights = {
            Comment = { italic = true },
            Directory = { bold = true },
            ErrorMsg = { italic = true, bold = true },
          },
          styles = {
            types = "NONE",
            methods = "NONE",
            numbers = "NONE",
            strings = "NONE",
            comments = "italic",
            keywords = "bold,italic",
            constants = "NONE",
            functions = "italic",
            operators = "NONE",
            variables = "NONE",
            parameters = "NONE",
            conditionals = "italic",
            virtual_text = "NONE",
          },
        })

        -- Aplicar el esquema de color
      end,
    },
    { "tomasr/molokai", lazy = false, priority = 1000 },

    {
      -- Plugin for enabling transparency
      "xiyaowong/transparent.nvim",
    },

    {
      "rose-pine/neovim",
      name = "rose-pine",
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "srcery-colors/srcery-vim", lazy = false, priority = 1000 },

    {
      -- LazyVim configuration
      "LazyVim/LazyVim",
      opts = {
        -- Set the default color scheme
        colorscheme = "onedark",
      },
    },
  },
}
