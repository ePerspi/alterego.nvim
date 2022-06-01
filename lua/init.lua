local alterego = require('alterego')

vim.api.nvim_create_user_command(alterego.usercmd, alterego.flip_word, {})
