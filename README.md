# antonyms.nvim
Neovim plugin to "flip" the word under the cursor, i.e replace it with its opposite a.k.a. its **antonym**.

### Installation
-   With [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use {
    "evanasse/antonyms.nvim",
    requires { "tpope/vim-repeat" },
    config = function()
        require("antonyms").setup()
    end
}
```

-   With [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
    "evanasse/antonyms.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
        require("alterego").setup()
    end
}

```

### Setup
(Optional) You can provide additional antonyms (word pairs) or overwrite the default ones.
```lua
require("antonyms").setup({
    antonyms = {
        { "young", "old" },
        { "light", "dark" }
    }
})
```

### Usage
#### User command
```vim
:FlipWord
```
#### (Default) Keymap
```vim
<leader>0
```

### Default Antonyms
|||
|:---:|:---:|
|true |false|
|True |False|
|TRUE |FALSE|
|1    |0    |
|yes  |no   |

#### How to add custom antonyms
Vim command
```vim
:lua require("antonyms").add_antonyms({"word1", "word2"})
```
Setup
```lua
require("antonyms").setup({
    antonyms = {
        { "word1", "word2" }
    }
})
```
