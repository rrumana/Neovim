-- Open directory manager / filetree (normal mode)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remapping netrw commands
vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end

    -- edit new file
    bind('n', '%')

    -- rename file
    bind('r', 'R')
  end
})

-- Fugitive mappings
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")

-- Harpoon mappings
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-M>", function() harpoon:list():next() end)

-- Telescope mappings
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pws', function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>pWs', function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-- Undotree mappings
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Trouble mappings
vim.keymap.set("n", "<leader>xx", function()
    require("trouble").toggle()
end)

vim.keymap.set("n", "[t", function()
    require("trouble").next({skip_groups = true, jump = true});
end)

vim.keymap.set("n", "]t", function()
    require("trouble").previous({skip_groups = true, jump = true});
end)

-- TreeSitter mappings
require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all"
    ensure_installed = {
        "vimdoc", "javascript", "typescript", "c", "lua", "rust",
        "jsdoc", "bash", "python", "java", "json", "html", "css",
        "go", "yaml", "toml", "cpp"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
    auto_install = true,

    indent = {
        enable = true
    },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = { "markdown" },
    },
})

local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
treesitter_parser_config.templ = {
    install_info = {
        url = "https://github.com/vrischmann/tree-sitter-templ.git",
        files = {"src/parser.c", "src/scanner.c"},
        branch = "master",
    },
}

vim.treesitter.language.register("templ", "templ")

-- Mapping moving highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remapping certain vim motions to be less weird
vim.keymap.set("n", "E", "$") -- Make E the EOL character instead of $
vim.keymap.set("v", "E", "$") -- Make E the EOL character instead of $
vim.keymap.set("n", "B", "0") -- Make B the BOL character instead of 0
vim.keymap.set("v", "B", "0") -- Make B the BOL character instead of 0
vim.keymap.set("i", "<Esc>", function()
    if vim.fn.col(".") == 1 then
        return "<Esc>"
    else
        return "<Esc>l"
    end
end, {noremap = true, expr = true, silent = true}) -- Move cursor to the right when exiting insert mode

-- Remapping visual block mode to <C-S-v> (NOT YET FUNCTIONAL)
vim.keymap.set("n", "<C-S-v>", "<Esc><C-v>")

-- Yanking / Copying
vim.keymap.set("n", "<C-c>", "y$") -- Yank to the end of line (normal mode)
vim.keymap.set("v", "<C-c>", "y")  -- Yank selected text (visual mode)
vim.keymap.set("i", "<C-c>", "<Esc>ly$i") -- Yank from current position to the end of line (insert mode)
vim.keymap.set("n", "<leader>c", "\"+y$") -- Copy till the end of the line to clipboard (normal mode)
vim.keymap.set("v", "<leader>c", "\"+y")  -- Copy selected text to clipboard (visual mode)

-- Putting / Pasting
vim.keymap.set("n", "<C-v>", "P") -- Put from buffer (normal mode)
vim.keymap.set("v", "<C-v>", "P") -- Put from buffer (visual mode)
vim.keymap.set("i", "<C-v>", function()
    if vim.fn.col(".") == 1 then
        return "<Esc>Pa"
    else
        return "<Esc>pa"
    end
end, {noremap = true, expr = true, silent = true}) -- Put from buffer (insert mode)
vim.keymap.set("n", "<leader>v", "\"+P") -- Paste from clipboard (normal mode)
vim.keymap.set("v", "<leader>v", "\"+P") -- Paste from clipboard (visual mode)

-- Other convenience mappings
vim.keymap.set("x", "<leader>p", "\"_dP") -- Paste from buffer without yanking (visual mode)
vim.keymap.set("n", "<leader>l", "yy") -- Yank current line (normal mode)

-- Deleting / Cutting
vim.keymap.set("n", "<C-x>", "d$") -- Delete from current cursor position to EOL (Normal mode)
vim.keymap.set("v", "<C-x>", "d")  -- Delete current selection (visual mode)
vim.keymap.set("i", "<C-x>", "<Esc>ld$i") -- Yank to the end of line (insert mode)
vim.keymap.set("n", "<leader>x", "\"+d$") -- Delete till the end of the line to clipboard (normal mode)
vim.keymap.set("v", "<leader>x", "\"+d")  -- Delete selected text to clipboard (visual mode)

-- Mapping undo
vim.keymap.set("n", "<C-z>", "u")
vim.keymap.set("v", "<C-z>", "<Esc>uv")
vim.keymap.set("i", "<C-z>", "<Esc>ui")

-- Mapping redo
vim.keymap.set("v", "<C-r>", "<Esc><C-r>v")
vim.keymap.set("i", "<C-r>", "<Esc><C-r>a")

-- Removing arrow keys in all modes
vim.keymap.set("n", "<Up>", ":echoe 'Use k'<CR>")
vim.keymap.set("n", "<Down>", ":echoe 'Use j'<CR>")
vim.keymap.set("n", "<Left>", ":echoe 'Use h'<CR>")
vim.keymap.set("n", "<Right>", ":echoe 'Use l'<CR>")
vim.keymap.set("v", "<Up>", "<Esc>:echoe 'Use k'<CR>")
vim.keymap.set("v", "<Down>", "<Esc>:echoe 'Use j'<CR>")
vim.keymap.set("v", "<Left>", "<Esc>:echoe 'Use h'<CR>")
vim.keymap.set("v", "<Right>", "<Esc>:echoe 'Use l'<CR>")
vim.keymap.set("i", "<Up>", "<Esc>:echoe 'Use k'<CR>")
vim.keymap.set("i", "<Down>", "<Esc>:echoe 'Use j'<CR>")
vim.keymap.set("i", "<Left>", "<Esc>:echoe 'Use h'<CR>")
vim.keymap.set("i", "<Right>", "<Esc>:echoe 'Use l'<CR>")
