
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
(global-set-key "\C-q" 'kill-current-buffer)

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


(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "C-<up>") 'move-line-up)
(global-set-key (kbd "C-<down>") 'move-line-down)


(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(global-set-key (kbd "C-s-<up>") 'move-region-up)
(global-set-key (kbd "C-s-<down>") 'move-region-down)
