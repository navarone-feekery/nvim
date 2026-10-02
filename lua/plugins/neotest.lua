return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "olimorris/neotest-rspec",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec")({
          rspec_cmd = function()
            return { "devbox", "run", "rspec" }
          end
        })
      }
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>tn", function()
      print("Starting nearest test...")
      require("neotest").run.run()
    end, { desc = "Run nearest test" })

    vim.keymap.set("n", "<leader>tf", function()
      print("Starting file tests...")
      require("neotest").run.run(vim.fn.expand("%"))
    end, { desc = "Run current file" })

    vim.keymap.set("n", "<leader>ts", function() require("neotest").run.run("spec") end, { desc = "Run all specs" })
    vim.keymap.set("n", "<leader>to", require("neotest").output.open, { desc = "Open test output" })
  end
}
