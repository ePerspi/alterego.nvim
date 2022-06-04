-- force lua to import the modules again
package.loaded["dev"] = nil
package.loaded["alterego"] = nil

vim.api.nvim_set_keymap("n", ",r", "<cmd>luafile dev/init.lua<cr>", {})

require("alterego").setup({
    alteregos = {
        { "bleu", "rouge" }
    }
})
