local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

-- Function to create a floating window
local function create_floating_terminal(opts)
	opts = opts or {}
	-- Define the size of the floating window
	local width = math.floor(vim.o.columns * 0.8) -- 80% of the editor width
	local height = math.floor(vim.o.lines * 0.8) -- 80% of the editor height

	-- Calculate the position to center the window
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Create a new buffer
	local buf = nil
	print(opts.buf)
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- Not listed, scratch buffer
	end

	-- Configure the floating window
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded", -- Border style: 'none', 'single', 'double', 'rounded', etc.
	})

	vim.api.nvim_create_autocmd({ "TermOpen" }, {
		pattern = "*",
		command = "startinsert",
	})

	-- Map <ESC><ESC> to close the floating window
	vim.api.nvim_buf_set_keymap(buf, "t", "<ESC><ESC>", "<cmd>close<CR>", { noremap = true, silent = true })

	return { buf = buf, win = win }
end

-- Add a command to trigger the floating window
vim.api.nvim_create_user_command("OpenFloatingWindow", function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_terminal({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.term()
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end, {})

vim.keymap.set("n", "<leader>o", "<cmd>OpenFloatingWindow<CR>")

-- vim: ts=2 sts=2 sw=2 et
