local M = {}

local usercmd = "FlipWord"

M.alteregos = {}

M.add_alteregos = function(word_pair)
    M.alteregos[word_pair[1]] = word_pair[2]
    M.alteregos[word_pair[2]] = word_pair[1]
end

local function _get_current_word()
    return vim.call("expand", "<cword>")
end

local function _t(code)
    return vim.api.nvim_replace_termcodes(code, true, true, true)
end

M.flip_word = function()
    local current_word = _get_current_word()
    local alterego = M.alteregos[current_word]

    if alterego then
        vim.cmd("normal! ciw" .. alterego)
    else
        print(
            "No alterego found for the word '" ..
            current_word ..
            "'. Add words with ':lua require(\"alterego\").add_alteregos({\"alter\", \"ego\"})'."
        )
    end
    vim.fn['repeat#set'](":" .. usercmd .. _t("<CR>"))
end

-- SETUP

M.setup = function(opts)
    -- Add default alteregos
    M.add_alteregos({ "true", "false" })
    M.add_alteregos({ "1", "0" })
    M.add_alteregos({ "yes", "no" })

    -- Add extra alteregos
    if opts then
        for _, word_pair in ipairs(opts["alteregos"]) do
            M.add_alteregos({ word_pair[1], word_pair[2] })
        end
    end

    -- Create user command
    vim.api.nvim_create_user_command(usercmd, M.flip_word, {})

    -- Set default mapping
    vim.api.nvim_set_keymap("n", "<leader>0", "<cmd>FlipWord<cr>", {})
end

return M
