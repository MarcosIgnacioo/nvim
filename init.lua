require "core"
local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.breakindent= true
vim.opt.showbreak = string.rep(" ",3)
vim.opt.linebreak = true
require "plugins"
-- En tu archivo init.lua

-- Asegúrate de que Python esté habilitado
if vim.fn.has('python3') == 1 then
  -- Establece el intérprete de Python para Neovim
  vim.g.python3_host_prog = '/ruta/al/entorno/virtual/bin/python'
end

