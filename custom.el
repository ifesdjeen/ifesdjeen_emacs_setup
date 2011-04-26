(set-face-foreground 'tabbar-default "LightSteelBlue")
(set-face-background 'tabbar-default "DarkSlateGray")
(set-face-foreground 'tabbar-selected "pale green")

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(completion-list-mode-default ((t (:inherit autoface-default :height 120 :family "Monaco"))) t)
 '(echo-area ((t (:stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "Monaco"))))
 '(tabbar-button ((t (:background "black" :foreground "lightgreen"))))
 '(tabbar-default ((((class color grayscale) (background dark)) (:inherit variable-pitch :background "black" :height 0.8))))
 '(tabbar-highlight ((t (:foreground "lightgreen"))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "green"))))
 '(tabbar-separator ((t (:inherit tabbar-default :foreground "gray"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))

(set-face-bold-p 'tabbar-selected t)
(set-face-attribute 'tabbar-button nil :box '(:line-width 1 :color "gray72"))

(setq tabbar-buffer-groups-function
   (lambda ()
     (list
      (cond
       ((find (aref (buffer-name (current-buffer)) 0) " *") "*")
       (t "All Buffers"))
      )))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-autoface-mode nil)
 '(aquamacs-customization-version-id 211 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(cua-mode t nil (cua-base))
 '(default-frame-alist (quote ((fringe) (right-fringe) (left-fringe . 1) (internal-border-width . 0) (cursor-type . box) (menu-bar-lines . 1) (background-color . "#0C1021") (background-mode . dark) (border-color . "black") (cursor-color . "#A7A7A7") (foreground-color . "#F8F8F8") (mouse-color . "sienna1") (vertical-scroll-bars) (tool-bar-lines . 0))))
 '(default-input-method "russian-computer")
 '(display-time-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
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

(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-tab-width 2)
(setq soft-tab-size 2)
(setq tab-size 2)
(set-face-background 'hl-line "#330")

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))


(global-set-key [C-down] 'enlarge-window)
(global-set-key [C-up] 'shrink-window)
(global-set-key [C-right] 'enlarge-window-horizontally)
(global-set-key [C-left] 'shrink-window-horizontally)

(global-set-key  [(meta return)] 'toggle-fullscreen)
(global-set-key [S-M-left] 'tabbar-backward-tab)
(global-set-key [S-M-right] 'tabbar-forward-tab)
;(global-set-key [?\C-z] 'shell) ;; shell
(global-set-key [?\C-x ?\C-g] 'goto-line) ;; goto line
(global-set-key [?\C-x ?\C-b] 'ibuffer) ;; great buffer switcher
(global-set-key "\C-c\C-w"  'compare-windows)
(global-set-key "\M-g"      'goto-line)
(global-set-key "\M-\C-^"   'describe-variable)
(global-set-key "\C-^"      'describe-key-briefly)
(global-set-key "\C-cw" 'where-is)

(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-ce" 'eval-buffer)
(global-set-key "\C-c!"     'revert-buffer-unconditionally)
;(global-set-key "\C-/"      'undo)
(global-set-key (kbd "M-]")
                #'(lambda (arg)
                    (interactive "p")
                    (save-excursion
                      (let ((deactivate-mark nil))
                        (indent-rigidly (min (point) (mark))
                                        (max (point) (mark))
                                        2)))))
(global-set-key (kbd "M-[")
                #'(lambda (arg)
                    (interactive "p")
                    (save-excursion
                      (let ((deactivate-mark nil))
                        (indent-rigidly (min (point) (mark))
                                        (max (point) (mark))
                                        (- 2))))))

(setq-default indicate-empty-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;(require-final-newline nil)
;(next-line-add-newlines nil)