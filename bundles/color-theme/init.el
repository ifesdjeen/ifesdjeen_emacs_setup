(add-to-list 'load-path (concat bundles-dir "color-theme/themes/solarized"))

(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-initialize)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;; (color-theme-solarized-light)
     (color-theme-solarized-dark)
))


;(load "themes/color-theme-blackboard.el")
;(load "themes/color-theme-twilight.el")
