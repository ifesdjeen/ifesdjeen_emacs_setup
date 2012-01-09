
;;
;; Window
;;

(global-set-key [C-down] 'enlarge-window)
(global-set-key [C-up] 'shrink-window)
(global-set-key [C-right] 'enlarge-window-horizontally)
(global-set-key [C-left] 'shrink-window-horizontally)

(global-set-key  [(meta return)] 'toggle-fullscreen)

(defun kill-current-buffer ()
  "Kill the current buffer without confirmation unless explicitly modified."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x w") 'kill-current-buffer)

(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\C-y" 'clipboard-yank)

;;
;; Navigation
;;

(global-set-key [S-M-left] 'tabbar-backward-tab)
(global-set-key [S-M-right] 'tabbar-forward-tab)

(global-set-key [?\C-x ?\C-g] 'goto-line) ;; goto line
(global-set-key [?\C-x ?\C-b] 'ibuffer) ;; great buffer switcher
(global-set-key "\M-g"        'goto-line)

(global-set-key (kbd "C-<") 'previous-multiframe-window)
(global-set-key (kbd "C->") 'next-multiframe-window)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; Misc
(global-set-key "\C-c\C-w"  'compare-windows)
(global-set-key "\M-\C-^"   'describe-variable)
(global-set-key "\C-^"      'describe-key-briefly)
(global-set-key "\C-cw"     'where-is)
(global-set-key "\C-ce"     'eval-buffer)

;; Text-editing
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-c!" 'revert-buffer-unconditionally)

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


(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "M-DEL") 'backward-kill-word)
(global-set-key (kbd "C-c n") (lambda () (interactive)
                                (delete-trailing-whitespace)
                                (untabify-buffer)))

(global-set-key (kbd "C-M-\\") 'indent-buffer)


;; Web
(global-set-key (kbd "C-x C-w") 'browse-url-default-macosx-browser)
(global-set-key (kbd "C-c C-o") 'google-region)

(setq default-tab-width 2)
(setq soft-tab-size 2)
(setq tab-size 2)
