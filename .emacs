(defvar emacsd-dir
  "~/.emacs.d/"
  "Emacs directory")

(defvar bundles-dir
  (concat emacsd-dir "bundles/")
  "Bundles dir")
(setq boot-file (concat emacsd-dir "boot.el"))
(load boot-file)


(scroll-bar-mode)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(clojure-swank-command "echo \"/Users/alexp/bin/lein2 jack-in %s\" | $SHELL -l")
 '(display-time-mode t)
 '(global-hl-line-mode t)
 '(indent-tabs-mode nil)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-cleanup-whitespace t)
 '(js2-indent-on-enter-key t)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(require-final-newline nil)
 '(standard-indent 2)
 '(tab-width 2)
 '(tabbar-background-color "black")
 '(tabbar-mode t nil (tabbar))
 '(tabbar-scroll-left-button (quote ((" <") " =")))
 '(tabbar-scroll-right-button (quote ((" >") " =")))
 '(tabbar-separator (quote ("  |  ")))
 '(tabbar-use-images nil)
 '(tool-bar-mode nil)
 '(visual-line-mode nil t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
