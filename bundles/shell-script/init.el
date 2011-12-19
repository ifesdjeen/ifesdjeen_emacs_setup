(yas/load-directory (concat bundles-dir "shell-script/snippets"))

(add-to-list 'auto-mode-alist '("\\.sh$" . shell-script-mode))

(add-to-list 'auto-mode-alist '("\\zshenv$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\zprofile$" . shell-script-mode))

