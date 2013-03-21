(defun initialize-with-theme ()
  (add-to-list 'load-path (concat bundles-dir "color-theme/themes/solarized"))

  (require 'color-theme)

  (require 'color-theme-solarized)

  (color-theme-initialize)

  (eval-after-load "color-theme"
    '(progn
       (color-theme-initialize)
       ;; (color-theme-solarized-light)
       (color-theme-solarized-dark)
       )))


;; (load "themes/color-theme-twilight.el")

(initialize-with-theme)
