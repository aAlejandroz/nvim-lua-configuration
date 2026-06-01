-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opt` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

require("lazy").setup({

	-- Main oil.nvim (file explorer)
	require("plugins.oil"),

	-- Luasnip
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- Automatically close paired characters
	{
		"m4xshen/autoclose.nvim",
		opts = {},
	},

	-- Smear-cursor effect
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			smear_between_buffers = true, -- Smear cursor when switching buffers or windows.
			smear_between_neighbor_lines = true, -- Smear cursor when moving within line or to neighbor lines.
		},
	},

	{
		"Bilal2453/luvit-meta",
		lazy = true,
	},

	-- Highlight line indention
	require("plugins.hlchunk"),

	require("plugins.lsp-config"),

	------------- GIT Plugins ----------------
	-- See `:help gitsigns` to understand what the configuration keys do
	require("plugins.gitsigns"),

	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},

	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},

	-- Git interration with oil.nvim
	{
		"refractalize/oil-git-status.nvim",

		dependencies = {
			"stevearc/oil.nvim",
		},

		config = true,
	},
	------------- GIT Plugins END ----------------

	require("plugins.which-key"),

	require("plugins.telescope"),

	require("plugins.autoformat"),

	require("plugins.autocompletion"),

	require("plugins.bufferline"),

	require("plugins.lualine"),

	require("plugins.alpha"),

	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")

			-- You can configure highlights by doing something like:
			vim.cmd.hi("Comment gui=none")
		end,
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
	},

	require("plugins.mini-nvim"),

	require("plugins.treesitter"),

	require("plugins.dap"),

	require("plugins.transfer"),

	{
		"rcarriga/nvim-notify",
	},

	-- require("plugins.nvimtree"),

	--  Here are some example plugins that I've included in the Kickstart repository.
	--  Uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	-- require 'kickstart.plugins.debug',
	-- require 'kickstart.plugins.indent_line',

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	-- { import = 'custom.plugins' },
	--
	-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
	-- Or use telescope!
	-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
	-- you can continue same window with `<space>sr` which resumes last telescope search
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- Helper function to open up a mini terminal session in Neovim
require("plugins.floatterminal")

vim.notify = require("notify")

-- vim: ts=2 sts=2 sw=2 et
