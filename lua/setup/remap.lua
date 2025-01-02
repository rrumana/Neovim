-- Defining a leader character, which will preface some commands
vim.g.mapleader = " "

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
