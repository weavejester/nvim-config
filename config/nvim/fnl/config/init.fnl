(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

;wrap lines
(set vim.wo.wrap true)

;space is reserved to be lead
(vim.keymap.set :n :<space> :<nop> {:noremap true})

;sets a nvim global options
(let [options
      {;tabs is space
       :expandtab true
       ;tab/indent size
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       ;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive searchon_publish_diagnostics
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"
       ;hide line numbers
       :number false
       ;show line and column number
       :ruler true
       ;makes signcolumn always one column with signs
       :signcolumn "yes:1"
       ;load in local configurations
       :exrc true}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

;set indentation to work like clojure-mode
(set vim.g.clojure_align_subforms 1)

{}
