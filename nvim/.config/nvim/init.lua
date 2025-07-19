require("config.lazy")
--opt
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
--keymaps
vim.keymap.set("n", "<Leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("n", "<Leader>|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<Leader>-", "<cmd>split<CR>")
vim.keymap.set("n", "<Leader>q", "<cmd>close<CR>")

--lsp
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

