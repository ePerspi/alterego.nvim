-- force lua to import the modules again
package.loaded["dev"] = nil
package.loaded["alterego"] = nil

vim.api.nvim_set_keymap("n", ",r", "<cmd>luafile dev/init.lua<cr>", {})

Alterego = require("alterego")
vim.api.nvim_set_keymap("n", ",w", "<cmd>lua Alterego.flip_word()<cr>", {})
