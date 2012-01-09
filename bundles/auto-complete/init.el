(load "auto-complete")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

;;(setq auto-mode-alist (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))