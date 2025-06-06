return {
  {
    {
      "olimorris/onedarkpro.nvim",
      priority = 1000, -- Se carga antes que otros plugins
      lazy = false, -- Se carga al inicio
      config = function()
        require("onedarkpro").setup({
          highlights = {
            Comment = { italic = false },
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
      priority = 1000,
      lazy = false, -- Se carga al inicio
      config = function()
        require("rose-pine").setup({
          highlights = {
            Comment = { italic = false },
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

    {
      -- LazyVim configuration
      "LazyVim/LazyVim",
      opts = {
        -- Set the default color scheme
        colorscheme = "onedark_dark",
      },
    },
  },
}
