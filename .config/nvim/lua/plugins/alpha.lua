return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                                        ]],
			[[                                                                                        ]],
			[[                                                                                        ]],
			[[                                                                                        ]],
			[[                                                                                        ]],
			[[   ██████   █████ █████   █████████    █████████   █████   █████ █████ ██████   ██████  ]],
			[[  ░░██████ ░░███ ░░███   ███░░░░░███  ███░░░░░███ ░░███   ░░███ ░░███ ░░██████ ██████   ]],
			[[   ░███░███ ░███  ░███  ███     ░░░  ░███    ░███  ░███    ░███  ░███  ░███░█████░███   ]],
			[[   ░███░░███░███  ░███ ░███          ░███████████  ░███    ░███  ░███  ░███░░███ ░███   ]],
			[[   ░███ ░░██████  ░███ ░███    █████ ░███░░░░░███  ░░███   ███   ░███  ░███ ░░░  ░███   ]],
			[[   ░███  ░░█████  ░███ ░░███  ░░███  ░███    ░███   ░░░█████░    ░███  ░███      ░███   ]],
			[[   █████  ░░█████ █████ ░░█████████  █████   █████    ░░███      █████ █████     █████  ]],
			[[  ░░░░░    ░░░░░ ░░░░░   ░░░░░░░░░  ░░░░░   ░░░░░      ░░░      ░░░░░ ░░░░░     ░░░░░   ]],
			[[                                                                                        ]],
		}

		dashboard.section.footer.val = {
			[[																			   	    ]],
			[[																			   	    ]],
			[[																			   	    ]],
			[[																			   	    ]],
			[[																			   	    ]],
			[[																			   	    ]],
			[[																			   	    ]],
			[[																			   	    ]],
			[[																			   	    ]],
			[[ 	"An idiot admires complexity, a genius admires simplicity. - Terry A. Davis 󰳶"  ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", " Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "󰋚 Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "󰈆 Quit", ":qa<CR>"),
		}

		dashboard.section.header.opts.hl = { 
			{ {"Red", 1, 1} },
			{ {"Red", 1, 1} },
			{ {"Red", 1, 1} },
			{ {"Red", 1, 1} },
			{ {"Red", 1, 1} },
			{ {"AlphaHeader1", 0, 300} },
			{ {"AlphaHeader1", 0, 300} },
			{ {"AlphaHeader2", 0, 300} }, 
			{ {"AlphaHeader2", 0, 300} },
			{ {"AlphaHeader3", 0, 300} },
			{ {"AlphaHeader3", 0, 300} },
			{ {"AlphaHeader4", 0, 300} },
			{ {"AlphaHeader4", 0, 300} },
			{ {"Red", 1, 1} },
		}

		dashboard.section.footer.opts.hl = 'AlphaFooter'

		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end

		vim.api.nvim_set_hl(0, "AlphaHeader1", { fg = "#94e2d5" })
		vim.api.nvim_set_hl(0, "AlphaHeader2", { fg = "#89dceb" })
		vim.api.nvim_set_hl(0, "AlphaHeader3", { fg = "#74c7ec" })
		vim.api.nvim_set_hl(0, "AlphaHeader4", { fg = "#89b4fa" })
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#b4befe" })
		vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#cdd6f4" })
		vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#74c7ec" })
		
		alpha.setup(dashboard.opts)
	end,
}
