;symbols to show for lsp diagnostics
(vim.diagnostic.config
  {:signs {:text {vim.diagnostic.severity.ERROR "●"
                  vim.diagnostic.severity.WARN "▲"
                  vim.diagnostic.severity.INFO "■"
                  vim.diagnostic.severity.HINT "□"}}})

[{1 :neovim/nvim-lspconfig
  :config
  (fn []
    ;; For more language servers check:
    ;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    (vim.lsp.config
      :* {:on_attach
          (fn [client bufnr]
            (let [normal-mode-mappings
                  {:gd "<Cmd>lua vim.lsp.buf.definition()<CR>"
                   :K "<Cmd>lua vim.lsp.buf.hover()<CR>"
                   :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>"
                   :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>"
                   :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>"
                   :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>"
                   :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>"
                   :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>"
                   :<leader>lf "<cmd>lua vim.lsp.buf.format()<CR>"
                   :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>"
                   :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>"
                   :<leader>la "<cmd>lua vim.lsp.buf.code_action()<CR>"
                   :<leader>lr
                   ":lua require('telescope.builtin').lsp_references()<cr>"
                   :<leader>li
                   ":lua require('telescope.builtin').lsp_implementations()<cr>"
                   :<leader>lw
                   ":lua require('telescope.builtin').diagnostics()<cr>"}
                  visual-mode-mappings
                  {:<leader>la "<cmd>lua vim.lsp.buf.range_code_action()<CR> "}]
              (each [k v (pairs normal-mode-mappings)]
                (vim.api.nvim_buf_set_keymap bufnr :n k v {:noremap true}))
              (each [k v (pairs visual-mode-mappings)]
                (vim.api.nvim_buf_set_keymap bufnr :v k v {:noremap true}))))
          :handlers
          {"textDocument/publishDiagnostics"
           (vim.lsp.with
             vim.lsp.diagnostic.on_publish_diagnostics
             {:severity_sort true
              :update_in_insert true
              :underline true
              :virtual_text false})
           "textDocument/hover"
           (vim.lsp.with
             vim.lsp.handlers.hover
             {:border "single"})
           "textDocument/signatureHelp"
           (vim.lsp.with
             vim.lsp.handlers.signature_help
             {:border "single"})}
          :before_init
          (fn [params]
            (set params.workDoneToken :1)) })

    ;; Clojure
    (vim.lsp.config
      :clojure_lsp
      {:root_dir
       (fn [bufnr on_dir]
         (let [pattern (vim.api.nvim_buf_get_name bufnr)
               util (require :lspconfig.util)
               fallback (vim.loop.cwd)
               patterns [:project.clj :deps.edn :build.boot
                         :shadow-cljs.edn :.git :bb.edn]
               root ((util.root_pattern patterns) pattern)]
           (on_dir (or root fallback))))})
    (vim.lsp.enable :clojure_lsp))}]
