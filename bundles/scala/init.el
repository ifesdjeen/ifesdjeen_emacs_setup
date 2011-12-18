(require 'scala-mode-auto)

;; load bundle snippets
(yas/load-directory (concat bundles-dir "scala/snippets"))

(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
