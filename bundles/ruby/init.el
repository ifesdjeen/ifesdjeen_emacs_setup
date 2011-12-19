(require 'ruby-mode)
(require 'inf-ruby)
(require 'ruby-electric)

(load "rinari/rinari")
(require 'rinari)
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
