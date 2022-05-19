M = {}

M.alteregos = {}

function M.add_alteregos(word_pair)
    M.alteregos[word_pair[1]] = word_pair[2]
    M.alteregos[word_pair[2]] = word_pair[1]
end

function M.get_current_word()
    return vim.call("expand", "<cword>")
end

function M.flip_word()
    local current_word = M.get_current_word()
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
end

M.add_alteregos({ "true", "false" })
M.add_alteregos({ "0", "1" })
M.add_alteregos({ "yes", "no" })

return M
