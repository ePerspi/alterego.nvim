local api = vim.api

local function matchstr(...)
    local ok, ret = pcall(vim.fn.matchstr, ...)

    if ok then
        return ret
    end

    return ""
end

local function get_word_under_cursor()
    local column = api.nvim_win_get_cursor(0)[2]
    local line = api.nvim_get_current_line()

    local left = matchstr(line:sub(1, column + 1), [[\k*$]])
    local right = matchstr(line:sub(column + 1), [[^\k*]]):sub(2)

    local word_under_cursor = left .. right

    return word_under_cursor
end

local function greet()
    print(get_word_under_cursor())
end

return greet
