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

-- Remapping certain vim motions to be less weird
vim.keymap.set("n", "E", "$") -- Make E the EOL character instead of $
vim.keymap.set("v", "E", "$") -- Make E the EOL character instead of $
vim.keymap.set("n", "B", "0") -- Make E the BOL character instead of 0
vim.keymap.set("v", "B", "0") -- Make E the BOL character instead of 0

-- Remapping visual block mode to <C-S-v> (NOT YET FUNCTIONAL)
vim.keymap.set("v", "<C-S-v>", "<Esc><C-v>")

-- Yanking / Copying
vim.keymap.set("n", "<C-c>", "y$") -- Yank to the end of line (normal mode)
vim.keymap.set("v", "<C-c>", "y")  -- Yank selected text (visual mode)
vim.keymap.set("i", "<C-c>", "<Esc>ly$i") -- Yank to the end of line (insert mode)
vim.keymap.set("n", "<leader>c", "\"+y$") -- Copy till the end of the line to clipboard (normal mode)
vim.keymap.set("v", "<leader>c", "\"+y")  -- Copy selected text to clipboard (visual mode)

-- Putting / Pasting
vim.keymap.set("n", "<C-v>", "P") -- Put from buffer (normal mode)
vim.keymap.set("v", "<C-v>", "P") -- Put from buffer (visual mode)
vim.keymap.set("i", "<C-v>", "<Esc>lPi") -- Put from buffer (insert mode)
vim.keymap.set("n", "<leader>v", "\"+P") -- Paste from clipboard (normal mode)
vim.keymap.set("v", "<leader>v", "\"+P") -- Paste from clipboard (visual mode)

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

