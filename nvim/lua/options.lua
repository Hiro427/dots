vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set cursorline")
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true -- Enable folding by default
vim.opt.foldlevel = 99 -- Start with all folds open

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.c,*.cpp,*go,*py,*rs,*lua,*java",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

vim.keymap.set("n", "<leader>r", function()
	local filename = vim.fn.expand("%") -- Get the current file name
	vim.cmd(":!run " .. filename .. " && echo ''") -- Run the command
end)

local function set_tab_style(tabstop, shiftwidth, expandtab)
	vim.opt_local.tabstop = tabstop
	vim.opt_local.shiftwidth = shiftwidth
	vim.opt_local.expandtab = expandtab
end

-- Create an autocmd group for 4-space styles
vim.api.nvim_create_augroup("FourSpaceStyle", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = "FourSpaceStyle",
	pattern = { "python", "go", "rust", "java" },
	callback = function()
		set_tab_style(4, 4, true) -- 4 spaces and expandtab
	end,
})

-- Create an autocmd group for 2-space styles
vim.api.nvim_create_augroup("TwoSpaceStyle", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = "TwoSpaceStyle",
	pattern = { "lua", "javascript", "typescript", "c" },
	callback = function()
		set_tab_style(2, 2, true) -- 2 spaces and expandtab
	end,
})

vim.g.template_dir = vim.fn.stdpath("config") .. "/templates"

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = { "*.sh", "*.py", "*.go", "*.js" },
	callback = function()
		-- Define headers for different file types
		local headers = {
			["*.sh"] = "#!/bin/env bash",
		}

		-- Get the file extension/pattern
		local filetype = vim.fn.expand("<afile>:e") -- Get the file extension
		local pattern = "*." .. filetype -- Match the extension to the header
		local header = headers[pattern] or nil -- Default to nil if no match

		if header then
			vim.api.nvim_buf_set_lines(0, 0, 0, false, { header, "" })
		end
	end,
})

-- vim.opt.list = true

-- vim.cmd("set updatetime=100")

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
})
