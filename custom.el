(set-face-foreground 'tabbar-default "LightSteelBlue")
(set-face-background 'tabbar-default "DarkSlateGray")
(set-face-foreground 'tabbar-selected "pale green")

(custom-set-faces
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
   '(column-number-mode t)
   '(cua-mode t nil (cua-base))
   '(default-input-method "russian-computer")
   '(display-time-mode t)
   '(indent-tabs-mode nil)
   '(show-paren-mode t)
   '(standard-indent 2)
   '(tab-width 2)
   '(tabbar-background-color "black")
   '(tabbar-mode t nil (tabbar))
   '(tabbar-scroll-left-button (quote ((" <") " =")))
   '(tabbar-scroll-right-button (quote ((" >") " =")))
   '(tabbar-separator (quote ("  |  ")))
   '(tabbar-use-images nil)
   '(tool-bar-mode nil)
   '(transient-mark-mode t))

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


(global-set-key  [(meta return)] 'toggle-fullscreen)
(global-set-key [S-M-left] 'tabbar-backward-tab)
(global-set-key [S-M-right] 'tabbar-forward-tab)
(global-set-key [?\C-z] 'shell) ;; shell
(global-set-key [?\C-x ?\C-g] 'goto-line) ;; goto line
(global-set-key [?\C-x ?\C-b] 'ibuffer) ;; great buffer switcher
(global-set-key "\C-c\C-w"  'compare-windows)
(global-set-key "\M-g"      'goto-line)
(global-set-key "\M-\C-^"   'describe-variable)
(global-set-key "\C-^"      'describe-key-briefly)
(global-set-key "\C-cw" 'where-is)
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
