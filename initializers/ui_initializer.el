(show-paren-mode)

(custom-set-variables
 '(display-time-mode t)
 '(global-hl-line-mode t)
 '(indent-tabs-mode nil)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(require-final-newline nil)
 '(standard-indent 2)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(visual-line-mode nil t))

(if window-system
    (ns-toggle-fullscreen))

(set-cursor-color "yellow")

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)