
return {
    'goolord/alpha-nvim',
    config = function()
	require('alpha').setup(require'alpha.themes.dashboard'.config)
	local alpha = require('alpha')
	local dashboard = require('alpha.themes.dashboard')

	dashboard.section.header.val = {
	    "   ▄███████▄    ▄████████ ███▄▄▄▄      ▄████████  ▄█      ███      ▄██████▄  ",
	    "  ███    ███   ███    ███ ███▀▀▀██▄   ███    ███ ███  ▀█████████▄ ███    ███ ",
	    "  ███    ███   ███    ███ ███   ███   ███    █▀  ███▌    ▀███▀▀██ ███    ███ ",
	    "  ███    ███   ███    ███ ███   ███   ███        ███▌     ███   ▀ ███    ███ ",
	    "▀█████████▀  ▀███████████ ███   ███ ▀███████████ ███▌     ███     ███    ███ ",
	    "  ███          ███    ███ ███   ███          ███ ███      ███     ███    ███ ",
	    "  ███          ███    ███ ███   ███    ▄█    ███ ███      ███     ███    ███ ",
	    " ▄████▀        ███    █▀   ▀█   █▀   ▄████████▀  █▀      ▄████▀    ▀██████▀  ",
	    "                                                                            ",
	}
	dashboard.section.buttons.val = {
	    dashboard.button("e", "  > New File", ":ene <BAR> startinsert <CR>"),
	    dashboard.button("f", "  > Search File", ":cd $HOME/code | Telescope find_files<CR>"),
	    dashboard.button("r", "  > Recent", ":cd $HOME/code | Telescope oldfiles<CR>"),
	    dashboard.button("p", "  > File Explorer", ":ene <BAR> Ex <CR>"),
	    dashboard.button("q", "󰈆  > Quit", ":qa<CR>")
	}
    end

}
