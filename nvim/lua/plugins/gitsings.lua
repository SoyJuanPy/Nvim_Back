return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  opts = {
    signs = {
      add = { text = "" },
      change = { text = "|" },
      delete = { text = "-" },
      topdelete = { text = "_" },
      changedelete = { text = "~" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 0,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
  },
}
