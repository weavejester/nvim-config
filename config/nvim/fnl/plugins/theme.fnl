[{1 :polirritmico/monokai-nightasty.nvim
  :lazy false
  :priority 1000
  :config
  (fn []
    (let [theme (require "monokai-nightasty")]
      (theme.setup {:dark_style_background :transparent})
      (theme.load)))}]
