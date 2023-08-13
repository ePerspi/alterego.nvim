local M = {}

local usercmd = "FlipWord"

M.antonyms = {}

M.add_antonyms = function(word_pair)
    M.antonyms[word_pair[1]] = word_pair[2]
    M.antonyms[word_pair[2]] = word_pair[1]
end

local function _get_current_word()
    return vim.call("expand", "<cword>")
end

local function _t(code)
    return vim.api.nvim_replace_termcodes(code, true, true, true)
end

M.flip_word = function()
    local current_word = _get_current_word()
    local antonyms = M.antonyms[current_word]

    if antonyms then
        vim.cmd("normal! ciw" .. antonyms)
    else
        print(
            "No antonyms found for the word '" ..
            current_word ..
            "'. Add words with ':lua require(\"antonyms\").add_antonyms({\"word1\", \"word2\"})'."
        )
    end
    vim.fn['repeat#set'](":" .. usercmd .. _t("<CR>"))
end

-- SETUP

M.setup = function(opts)
    -- Add default antonyms
    M.add_antonyms({ "true", "false" })
    M.add_antonyms({ "TRUE", "FALSE" })
    M.add_antonyms({ "True", "False" })
    M.add_antonyms({ "1", "0" })
    M.add_antonyms({ "yes", "no" })

    -- Add extra antonyms
    if opts then
        for _, word_pair in ipairs(opts["antonyms"]) do
            M.add_antonyms({ word_pair[1], word_pair[2] })
        end
    end

    -- Create user command
    vim.api.nvim_create_user_command(usercmd, M.flip_word, {})

    -- Set default mapping
    vim.api.nvim_set_keymap("n", "<leader>0", "<cmd>FlipWord<cr>", {})
end

return M
