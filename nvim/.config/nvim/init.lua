--vim options
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.virtualedit = "all"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 12
vim.opt.guicursor = ""
vim.opt.colorcolumn = "80"
vim.opt.winborder = "rounded"
vim.g.mapleader= " "

 -- --keymaps
vim.keymap.set("n", "<Leader>e", "<cmd>Ex<CR>")

--splits
vim.keymap.set("n", "<Leader>|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<Leader>-", "<cmd>split<CR>")
--move between split
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
-- resize splits
vim.keymap.set("n", "<C-Right>", "<C-w>>")
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Up>", "<C-w>-")
vim.keymap.set("n", "<C-Down>", "<C-w>+")

--copy to clipboard
vim.keymap.set({ "n", "v","x"}, "<Leader>y", '"+y <CR>')

vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format)

--packages
vim.pack.add{
	--colorscheme
	{src = "https://github.com/catppuccin/nvim.git"},
	--telescope package
	{src = "https://github.com/nvim-telescope/telescope.nvim"},
	{src = "https://github.com/nvim-lua/plenary.nvim"},

	--treesitter
	{src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main"},

	--completions
	{src = "https://github.com/rafamadriz/friendly-snippets"},
	{src = "https://github.com/Saghen/blink.cmp",opts ={}},
	--LSP
	{src = "https://github.com/neovim/nvim-lspconfig",deps = {"blink.cmp"}},
	{src = "https://github.com/mason-org/mason.nvim"},
	{src = "https://github.com/mason-org/mason-lspconfig.nvim"},

	{src = "https://github.com/L3MON4D3/LuaSnip"}


}
--colorscheme
vim.cmd("colorscheme catppuccin-mocha")

--telescope
require('telescope').setup{}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

--LSP 
local lsp =  require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		"clangd", "pyright", "bashls", "html", "emmet_ls"
	}
}
--completions
local capabilities = require('blink.cmp').get_lsp_capabilities()
local servers = {"clangd", "pyright", "bashls", "html", "emmet_ls"}

for _, server in ipairs(servers) do
	lsp[server].setup{capabilities = capabilities}
end

 require("blink.cmp").setup({
  keymap = { preset = "default" },
  appearance = {nerd_font_variant = 'mono'},
  completion ={documentation = {auto_show = false}},
  sources = {
	  default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = "lua" }
})
--diagnostic
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

