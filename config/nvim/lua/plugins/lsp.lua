-- [nfnl] fnl/plugins/lsp.fnl
vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\145\167", [vim.diagnostic.severity.WARN] = "\239\132\170", [vim.diagnostic.severity.INFO] = "\239\132\169", [vim.diagnostic.severity.HINT] = "\239\131\171"}}})
local function _1_()
  local function _2_(client, bufnr)
    local normal_mode_mappings = {gd = "<Cmd>lua vim.lsp.buf.definition()<CR>", K = "<Cmd>lua vim.lsp.buf.hover()<CR>", ["<leader>ld"] = "<Cmd>lua vim.lsp.buf.declaration()<CR>", ["<leader>lt"] = "<cmd>lua vim.lsp.buf.type_definition()<CR>", ["<leader>lh"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>", ["<leader>ln"] = "<cmd>lua vim.lsp.buf.rename()<CR>", ["<leader>le"] = "<cmd>lua vim.diagnostic.open_float()<CR>", ["<leader>lq"] = "<cmd>lua vim.diagnostic.setloclist()<CR>", ["<leader>lf"] = "<cmd>lua vim.lsp.buf.format()<CR>", ["<leader>lj"] = "<cmd>lua vim.diagnostic.goto_next()<CR>", ["<leader>lk"] = "<cmd>lua vim.diagnostic.goto_prev()<CR>", ["<leader>la"] = "<cmd>lua vim.lsp.buf.code_action()<CR>", ["<leader>lr"] = ":lua require('telescope.builtin').lsp_references()<cr>", ["<leader>li"] = ":lua require('telescope.builtin').lsp_implementations()<cr>", ["<leader>lw"] = ":lua require('telescope.builtin').diagnostics()<cr>"}
    local visual_mode_mappings = {["<leader>la"] = "<cmd>lua vim.lsp.buf.range_code_action()<CR> "}
    for k, v in pairs(normal_mode_mappings) do
      vim.api.nvim_buf_set_keymap(bufnr, "n", k, v, {noremap = true})
    end
    for k, v in pairs(visual_mode_mappings) do
      vim.api.nvim_buf_set_keymap(bufnr, "v", k, v, {noremap = true})
    end
    return nil
  end
  local function _3_(params)
    params.workDoneToken = "1"
    return nil
  end
  vim.lsp.config("*", {on_attach = _2_, handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, update_in_insert = true, underline = true, virtual_text = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}, before_init = _3_})
  local function _4_(bufnr, on_dir)
    local pattern = vim.api.nvim_buf_get_name(bufnr)
    local util = require("lspconfig.util")
    local fallback = vim.loop.cwd()
    local patterns = {"project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"}
    local root = util.root_pattern(patterns)(pattern)
    return on_dir((root or fallback))
  end
  vim.lsp.config("clojure_lsp", {root_dir = _4_})
  return vim.lsp.enable("clojure_lsp")
end
return {{"neovim/nvim-lspconfig", config = _1_}}
