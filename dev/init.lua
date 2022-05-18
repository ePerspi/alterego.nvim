-- force lua to import the modules again
package.loaded["dev"] = nil
package.loaded["greetings"] = nil
package.loaded["greetings.awesome-module"] = nil

vim.api.nvim_set_keymap("n", ",r", "<cmd>luafile dev/init.lua<cr>", {})

Greetings = require("greetings")
vim.api.nvim_set_keymap("n", ",w", "<cmd>lua Greetings.greet()<cr>", {})
