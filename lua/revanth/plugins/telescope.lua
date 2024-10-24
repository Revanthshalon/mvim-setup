return {
  "nvim-telescope/telescope.nvim", 
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local open_with_trouble = require("trouble.sources.telescope").open

    local add_to_trouble = require("trouble.sources.telescope").add
    
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "List previously open files" })
    keymap.set("n", "<leader>fg", builtin.grep_string, { desc = "Search for string under cursor" })
    
    telescope.setup({
      defaults = {
        mappings = {
          i = { ["<c-t>"] = open_with_trouble },
          n = { ["<c-t>"] = open_with_trouble },
        },
      },
    })
  end,
}
