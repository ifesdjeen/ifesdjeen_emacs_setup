(load "haml-mode")
(load "sass-mode")

;; load bundle snippets
(yas/load-directory (concat bundles-dir "haml/snippets"))

(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))