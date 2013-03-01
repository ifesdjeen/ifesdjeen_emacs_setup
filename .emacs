y(defvar emacsd-dir
  "~/.emacs.d/"
  "Emacs directory")

(defvar bundles-dir
  (concat emacsd-dir "bundles/")
  "Bundles dir")
(setq boot-file (concat emacsd-dir "boot.el"))
(load boot-file)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(clojure-swank-command "echo \"/Users/ifesdjeen/bin/lein jack-in %s\" | $SHELL -l")
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
 '(idle-highlight ((t (:inherit region :foreground "Orange")))))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(setq js-indent-level 2)
(setq java-indent-level 2)
(setq c-basic-offset 2)
(setq css-indent-offset 2)


(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode t)))
(put 'set-goal-column 'disabled nil)


(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("/Users/ifesdjeen/bin")))
