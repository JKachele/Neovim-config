local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Save and Quit
keymap("n", "<C-s>", ":wa<CR>", opts)
keymap("i", "<C-s>", "<ESC>:wa<CR>a", opts)
keymap("n", "<C-x>", ":qa<CR>", opts)
keymap("n", "<C-q>", ":q<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-q>", ":Bdelete<CR>", opts)

-- Add new line in normal mode
keymap("n", "<enter>", "o<esc>", opts)
keymap("n", "<S-enter>", "O<esc>", opts)

-- Refactor Variable
keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- Visual --
keymap("n", "<A-v>", "<C-v>", opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

--PageUp/PageDown
keymap("n", "<PageUp>", "<C-u>", opts)
keymap("n", "<PageDown>", "<C-d>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
keymap("n", "lg", ":lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Telescope --
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-g>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>tk", "<cmd>Telescope keymaps<cr>", opts)

-- Nvimtree --
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- GitLine --
keymap("n", "<leader>g", ":Gitsigns preview_hunk<cr>", opts)

-- lsp_lines --
vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- Templates --
keymap("n", "<A-c>", ":Template cppMain<cr>", opts)
keymap("n", "<A-p>", ":Template pyMain<cr>", opts)

-- Tasks Cmake --
keymap("n", "cs", ":Task start cmake configure<cr>", opts)
keymap("n", "cg", ":Task set_module_param cmake target<cr>", opts)
keymap("n", "cr", "<C-w>l:copen 4<Bar> Task start cmake run<cr>", opts)
keymap("n", "cd", ":Task start cmake debug<cr>", opts)
keymap("n", "cx", "<C-w>l<C-w>j:q<cr>", opts)

-- Debugging --
keymap("n", "<F5>", ":lua require'dap'.continue()<cr>", opts)
keymap("n", "<F7>", ":lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", ":lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F9>", ":lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>B", ":lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<cr>", opts)
