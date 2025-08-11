return {
   -- Finds and lists all of the TODO, HACK, WARN, PERF, NOTE, TEST, FIX, FIXME, etc comment
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    config= function()
      local todo_comments = require("todo-comments")
      todo_comments.setup()
    end,
    keys = {
      -- { "<leader>t", '<cmd>TodoQuickFix<CR>', desc = "[T]odo quickfix" }, -- For making it work everywhere
      { "<leader>st", '<cmd>TodoTelescope<CR>', desc = "[T]odo search" }, -- For using Telescope
      -- { "<leader>tn", function() require("todo-comments").jump_next() end, desc = "[T]odo [N]ext comment" },
      -- { "<leader>tp", function() require("todo-comments").jump_prev() end, desc = "[T]odo [P]revious comment" },
    },
  },
}
