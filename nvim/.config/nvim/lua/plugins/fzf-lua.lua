return {
    { "ibhagwan/fzf-lua",
    opts = {"telescope"},
    keys = {
        { "<leader>sf", "<cmd>FzfLua files<cr>", desc = "Find files" },
        { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
        { "<leader>sb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
        { "<leader>sa", "<cmd>FzfLua args<cr>", desc = "Find args" },
        { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help tags" },
        { "<leader>sr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
    },
}
}
