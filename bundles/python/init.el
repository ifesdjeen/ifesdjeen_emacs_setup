(require 'python-mode)
;;(require 'pymacs)
;;(require 'pycomplete)
;;(require 'doctest-mode)

(add-to-list 'auto-mode-alist '("wscript$" . python-mode))
(add-to-list 'auto-mode-alist '("SConstruct$" . python-mode))

;; load bundle snippets
(yas/load-directory (concat bundles-dir "python/snippets"))