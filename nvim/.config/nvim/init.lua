local options = require("user.options")
local plugins = require("user.plugins")
local colors = require("user.colors")
local telescope = require("user.telescope")
local keymap = require("user.keymap")
local treesitter = require("user.treesitter")
local completion = require("user.completion")
local lsp = require("user.lsp")



options.setup()
plugins.setup()
colors.setup()
telescope.setup()
keymap.setup()
treesitter.setup()
completion.setup()
lsp.setup()
