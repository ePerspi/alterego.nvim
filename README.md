# alterego.nvim
Neovim plugin to "flip" the word under the cursor, i.e replace it with its opposite a.k.a. its **alterego**.

### Installation
-   With [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use {
    "evanasse/alterego.nvim",
    requires { "tpope/vim-repeat" },
    config = function()
        require("alterego").setup()
    end
}
```
-   With [vim-plug](https://github.com/junegunn/vim-plug)
```lua
Plug 'tpope/vim-repeat'
Plug 'evanasse/alterego.nvim'

" Somewhere after plug#end()
lua require("alterego").setup()
```

### Setup
You can provide additional alteregos (word pairs) or overwrite the default ones.
```lua
require("alterego").setup({
    alteregos = {
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
#### Keymap
```vim
<leader>0
```

### Default Alteregos
|true|false|
|1|0|
|yes|no|

#### How to add custom alteregos
Vim command
```vim
:lua require("alterego").add_alteregos({"word1", "word2"})
```
Setup
```lua
require("alterego").setup({
    alteregos = {
        { "word1", "word2" }
    }
})
```
