(require 'ruby-mode)
(require 'inf-ruby)
(require 'ruby-electric)

;; (load "rinari/rinari")
;; (require 'rinari)
;;(require 'autotest)
;;(require 'toggle)

(load "ri-emacs/ri")

;; load bundle snippets
(yas/load-directory (concat bundles-dir "ruby/snippets"))

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("*ruby-scratch*" . ruby-mode))

(defun esk-paredit-nonlisp ()
	  "Turn on paredit mode for non-lisps."
	  (set (make-local-variable 'paredit-space-for-delimiter-predicate)
	       (lambda (endp delimiter)
	         (equal (char-syntax (char-before)) ?\")))
	  (paredit-mode 1))

(add-hook 'ruby-mode-hook 'esk-paredit-nonlisp)
