M = {}
M.alteregos = {}
M.usercmd = "FlipWord"

function M.add_alteregos(word_pair)
    M.alteregos[word_pair[1]] = word_pair[2]
    M.alteregos[word_pair[2]] = word_pair[1]
end

function M._get_current_word()
    return vim.call("expand", "<cword>")
end

function M.flip_word()
    local current_word = M._get_current_word()
    local alterego = M.alteregos[current_word]

    if alterego then
        vim.cmd("normal! ciw" .. alterego)
        vim.fn['repeat#set'](":" .. M.usercmd .. vim.api.nvim_replace_termcodes("<CR>", true, true, true))
    else
        print(
            "No alterego found for the word '" ..
            current_word ..
            "'. Add words with ':lua require(\"alterego\").add_alteregos({\"alter\", \"ego\"})'."
        )
    end

end

M.add_alteregos({ "true", "false" })
M.add_alteregos({ "1", "0" })
M.add_alteregos({ "yes", "no" })

return M
