(require 'undo-tree)

(require 'deft)
(setq deft-extension "md")
(setq deft-directory "~/evernote")
(global-set-key [f8] 'deft)
(setq deft-text-mode 'markdown-mode)


;; (require 'mmm-auto)
(require 'mmm-mode)

(mmm-add-group
 'ruby-and-stuff
 '((clojure-m
    :submode clojure-mode
    :match-face (("```clojure"  . mmm-code-submode-face))
    :front "<%clojure"
    :back "%>")
   (ruby-m
    :submode ruby-mode
    :match-face (("```ruby"  . mmm-code-submode-face))a
    :front "<%ruby"
    :back "%>"
    ;; :front "```ruby"
    ;; :back "```"
)))

(mmm-add-group
 'fancy-html
 '((html-erb
    :submode ruby-mode
    :match-face (("<%#" . mmm-comment-submode-face)
                 ("<%=" . mmm-output-submode-face)
                 ("<%"  . mmm-code-submode-face))
    :front "<%[#=]?"
    :back "%>"
    :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
             (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
             (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @)))))

(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil fancy-html))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil ruby-and-stuff))


(global-set-key [f2] 'mmm-mode)

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
