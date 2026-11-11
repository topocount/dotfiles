vim.g.mapleader = "\\"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	-- Check out the lazy.nvim commit pinned in lazy-lock.json. A fresh clone only has upstream refs,
	-- so a pin that isn't upstream code fails here instead of running.
	local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
	local commit = vim.json.decode(table.concat(vim.fn.readfile(lockfile), "\n"))["lazy.nvim"].commit
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--no-checkout",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	if vim.v.shell_error == 0 then
		out = vim.fn.system({ "git", "-C", lazypath, "checkout", "--quiet", commit })
	end
	if vim.v.shell_error ~= 0 then
		vim.fn.delete(lazypath, "rf")
		error("lazy.nvim bootstrap failed:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	"tpope/vim-sleuth",
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			terminal = {
				snacks_win_opts = {
					wo = {
						winhighlight = "Normal:ClaudeCodeNormal,NormalNC:ClaudeCodeNormal,FloatBorder:ClaudeCodeBorder,WinSeparator:ClaudeCodeBorder",
					},
				},
			},
		},
		keys = {
			{ "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
			{ "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
		},
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	},
	"rafamadriz/friendly-snippets",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		opts = { ensure_installed = { "sqlfluff" } },
	},
	{
		"mfussenegger/nvim-lint",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>t", builtin.find_files, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		end,
	},
	"preservim/vim-markdown",
	"rust-lang/rust.vim",
	"jparise/vim-graphql",
	"prettier/vim-prettier",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-dispatch",
	"tpope/vim-rhubarb",
	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",
	"airblade/vim-gitgutter",
	"ryanoasis/vim-devicons",
	"patstockwell/vim-monokai-tasty",
})

-- Claude Code terminal colors
vim.api.nvim_set_hl(0, "ClaudeCodeNormal", { bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "ClaudeCodeBorder", { fg = "#ff9e64", bg = "#1a1b26" })

-- Neovim's markdown ftplugin starts treesitter; keep vim-markdown's regex highlighting instead.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(ev)
		vim.treesitter.stop(ev.buf)
	end,
})

-- Format on save by piping the buffer through a formatter.
local formatters = {
	go = { "gofmt" },
	lua = { "stylua", "--search-parent-directories", "-" },
}
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("UserFormatOnSave", {}),
	callback = function(ev)
		local cmd = formatters[vim.bo[ev.buf].filetype]
		if not cmd or vim.fn.executable(cmd[1]) == 0 then
			return
		end
		local lines = vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)
		local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(ev.buf))
		local res = vim.system(cmd, {
			stdin = table.concat(lines, "\n") .. "\n",
			cwd = vim.fn.isdirectory(dir) == 1 and dir or nil,
		}):wait()
		if res.code ~= 0 then
			vim.notify(cmd[1] .. ": " .. (res.stderr or ""), vim.log.levels.WARN)
			return
		end
		local formatted = vim.split(res.stdout, "\n")
		if formatted[#formatted] == "" then
			table.remove(formatted)
		end
		if not vim.deep_equal(lines, formatted) then
			local view = vim.fn.winsaveview()
			vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, formatted)
			vim.fn.winrestview(view)
		end
	end,
})

-- nvim-lint
require("lint").linters_by_ft = {
	sql = { "sqlfluff" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()

		-- You can call `try_lint` with a linter name or a list of names to always
		-- run specific linters, independent of the `linters_by_ft` configuration
		-- require("lint").try_lint("sqlfluff")
	end,
})

-- LSP config (native vim.lsp.config API)
vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.config("solidity_ls", {
	cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
	filetypes = { "solidity" },
	root_markers = { "foundry.toml" },
	single_file_support = true,
})

vim.lsp.config("lua_ls", {
	on_init = function(client)
		if not client.workspace_folders or not client.workspace_folders[1] then
			return true
		end
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
					format = {
						enable = true,
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
						},
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
})

vim.lsp.enable({
	"solidity_ls",
	"ts_ls",
	"rust_analyzer",
	"gopls",
	"vimls",
	"terraformls",
	"yamlls",
	"eslint",
	"biome",
	"lua_ls",
})

-- luasnip setup
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
		["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
		-- C-b (back) C-f (forward) for snippet placeholder navigation.
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", ":aboveleft split | lua vim.lsp.buf.definition()<CR>", { noremap = true })
		vim.keymap.set("n", "gdd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true })
		vim.keymap.set("n", "gD", ":aboveleft split | lua vim.lsp.buf.declaration()<CR>", { noremap = true })
		vim.keymap.set(
			"n",
			"gpD",
			"<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
			{ noremap = true }
		)
		vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set(
			"n",
			"gi",
			"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
			{ noremap = true }
		)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- lsp goto preview plugin
require("goto-preview").setup({
	width = 120, -- Width of the floating window
	height = 15, -- Height of the floating window
	border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
	default_mappings = true, -- Bind default mappings
	debug = false, -- Print debug information
	opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
	resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
	post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
	post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
	-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
	focus_on_open = false, -- Focus the floating window when opening it.
	dismiss_on_move = true, -- Dismiss the floating window when moving the cursor.
	force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
	bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
	stack_floating_preview_windows = true, -- Whether to nest floating windows
	preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
})

-- vim.lsp.set_log_level(vim.log.levels.DEBUG)

vim.opt.termguicolors = true
vim.cmd.colorscheme("topo")
