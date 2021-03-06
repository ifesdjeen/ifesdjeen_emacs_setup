(require 'undo-tree)

(require 'deft)
(setq deft-extension "md")
(setq deft-directory "~/evernote")
(global-set-key [f8] 'deft)
(setq deft-text-mode 'markdown-mode)

(require 'idle-highlight-mode)

(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (if window-system (hl-line-mode t))
  (idle-highlight-mode t))

(add-hook 'ruby-mode-hook 'my-coding-hook)
(add-hook 'clojure-mode-hook 'my-coding-hook)
(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)

;; (add-hook 'js2-mode-hook 'my-coding-hook)
