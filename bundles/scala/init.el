(require 'scala-mode-auto)

;; load bundle snippets
(yas/load-directory "~/.emacs.d/bundles/scala/snippets")

(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
