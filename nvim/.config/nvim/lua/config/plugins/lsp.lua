return {
    -- lsp package manager
    {
	"mason-org/mason.nvim",
	config = function ()
	    require("mason").setup{}
	end
    },

    --lsp mason config
    {
	"mason-org/mason-lspconfig.nvim",
	config = function ()
	    require("mason-lspconfig").setup({
		ensure_installed = { "clangd", "pyright", "bashls", "html", "emmet_ls"}
	    })
	end
    },
    --lsp config
   {
      "neovim/nvim-lspconfig",
      dependencies = {
	    'saghen/blink.cmp',
	 {
	    "folke/lazydev.nvim",
	    ft = "lua", -- only load on lua files
	    opts = {
	       library = {
		  -- See the configuration section for more details
		  -- Load luvit types when the `vim.uv` word is found
		  { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	       },
	    },
	 },
      },

      config = function ()
	 local capabilities = require('blink.cmp').get_lsp_capabilities()
	 require("lspconfig").lua_ls.setup { capabilities = capabilities}
	 require("lspconfig").pyright.setup { capabilities = capabilities }
	 require("lspconfig").html.setup { capabilities = capabilities }
	 require("lspconfig").emmet_ls.setup { vim.lsp.protocol.make_client_capabilities() }
	 require("lspconfig").bashls.setup {}

      end,
   }

}
