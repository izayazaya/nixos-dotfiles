return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				bufferline = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")

		local bg_transparency = true

		vim.api.nvim_set_hl(0, "LineNr", { fg = "#cdd6f4" })

		local toggle_transparency = function()
			bg_transparency = not bg_transparency
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = bg_transparency,
			})
			vim.cmd("colorscheme catppuccin")
			if bg_transparency then
				vim.api.nvim_set_hl(0, "LineNr", { fg = "#cdd6f4" })
			else
				vim.api.nvim_set_hl(0, "LineNr", { fg = "#45475b" })
			end
		end

		vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
	end,
}
