[{1 :luukvbaal/statuscol.nvim
  :config
  (fn []
    (let [statuscol (require "statuscol")]
      (statuscol.setup
        {:segments
         [{:click "v:lua.ScSa"
           :sign {:name [".*"]
                  :text [".*"]
                  :maxwidth 1
                  :colwidth 1}}]})))}]
