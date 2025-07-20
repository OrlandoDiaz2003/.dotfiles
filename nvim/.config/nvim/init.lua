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
vim.opt.scrolloff = 10
vim.opt.guicursor = ""
vim.opt.colorcolumn = "80"
--keymaps
vim.keymap.set("n", "<Leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("n", "<Leader>|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<Leader>-", "<cmd>split<CR>")

vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)

vim.keymap.set({ "n", "v" }, "<Leader>y>", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format)

--lsp
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
--autocmd
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
