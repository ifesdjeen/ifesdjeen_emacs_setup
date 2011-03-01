(set-default-font "Consolas-10")

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Extension files path
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme/")
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c")
(add-to-list 'load-path "~/.emacs.d/vendor/rspec-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(add-to-list 'load-path "~/.emacs.d/vendor/cucumber")
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(add-to-list 'load-path "~/.emacs.d/vendor/haml-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/sass-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/git-emacs") 
(add-to-list 'load-path "~/.emacs.d/vendor/yaml-mode") 
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")

;(add-to-list 'load-path "~/.emacs.d/muse-el/")
(setenv "PATH" (concat "/opt/l ocal/bin:/usr/local/bin:/usr/local/git/bin" (getenv "PATH")))
(push "/usr/local/git/bin" exec-path)

(fmakunbound 'git-status) ; Possibly remove Debian's autoloaded version
(require 'git-emacs-autoloads)
(require 'yaml-mode)

;; Rinari
(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching 1) ;; enable fuzzy matching

(require 'rinari)

;; auto-complete

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.rake$" . ruby-mode)) auto-mode-alist))

(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                     interpreter-mode-alist))

;(autoload 'run-ruby "inf-ruby"
;  "Run an inferior Ruby process")
;(autoload 'inf-ruby-keys "inf-ruby"
;  "Set local key defs for inf-ruby in ruby-mode")
;(add-hook 'ruby-mode-hook
;      '(lambda ()
;         (inf-ruby-keys)
;))

;;; Set up navigation keys for moving up and down
(require 'smooth-scrolling)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(global-set-key [up] (lambda () (interactive) (scroll-down 1)))
(global-set-key [down] (lambda () (interactive) (scroll-up 1)))

(global-set-key [left] (lambda () (interactive) (scroll-right tab-width t)))
(global-set-key [right] (lambda () (interactive) (scroll-left tab-width t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; kill current buffer
(defun prh:kill-current-buffer ()
    (interactive)
    (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x w") 'prh:kill-current-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tabbar initialization
(require 'tabbar)
(tabbar-mode)
;; tabbar end

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color - scheme initialization
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/vendor/color-theme/themes/color-theme-blackboard.el")


(if window-system
    (color-theme-blackboard))



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line numbers toggling
;;(add-hook ‘find-file-hook (lambda () (linum-mode 1)))
(require 'linum)
(global-linum-mode 1)

;;(ffap-bindings)
;;(require 'ffap-)
;;(add-hook 'dired-mode-hook 'ffap-inhibit-here)
;;(require 'find-recursive)



(setq auto-mode-alist
      (append '(
;;                ("\\.\\(war\\|ear\\|WAR\\|EAR\\)\\'" . archive-mode)        ; java archives
                ("\\.s?html?\\'"                     . html-mode)
                ("\\.py$"                            . python-mode)
                ("\\.html$"                          . html-mode)
                ("\\.htm$"                           . html-mode)
                ("\\.md$"                            . emacs-lisp-mode)     ; what the hell is an .md file?
                ("\\.el$"                            . emacs-lisp-mode)
                ("\\.js\\'"                          . javascript-mode)
                ("\\.yml\\'"                         . yaml-mode)
                ("\\.txt$"                           . text-mode)
                ) auto-mode-alist ))


;(require 'htmlize)
;(setq htmlize-output-type 'inline-css)
(define-key isearch-mode-map "\C-h" 'isearch-quote-char)

;;(require 'hideshow)  ; builtin to emacs

(autoload 'javascript-mode "javascript" nil t)

;; To customize the background color
;(set-face-background 'highlight-current-line-face "light yellow")
(global-hl-line-mode 1)

;; To customize the background color

(require 'haml-mode)
(require 'sass-mode)

  (autoload 'mode-compile "mode-compile"
   "Command to compile current buffer file based on the major mode" t)
  (global-set-key "\C-cc" 'mode-compile)
  (autoload 'mode-compile-kill "mode-compile"
   "Command to kill a compilation launched by `mode-compile'" t)
  (global-set-key "\C-ck" 'mode-compile-kill)



(require 'yasnippet) ;;; not yasnippet-bundle
(yas/initialize)
;(yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")
;(yas/load-directory yas/root-directory)
(global-set-key (kbd "C-x C-e") 'yas/expand)
(setq yas/indent-line 'fixed)

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)

(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))

;; Open Emacs configuration file
(defun emacs-config-file ()
  "Open Emacs Configuration File"
  (interactive)
  (find-file "~/.emacs"))

;; Set the tab width
(setq default-tab-width 2)
(setq tab-width 2)
(setq c-basic-indent 2)

;; Yas loading configuration
(add-hook 'ruby-mode-hook
          (lambda ()
            (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets/ruby-mode/")
            ))
(add-hook 'haml-mode-hook
          (lambda ()
            (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets/haml-mode/")
            ))
(add-hook 'rspec-mode-hook
          (lambda ()
            (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets/rspec-mode/")
            ))

;(add-hook 'ruby-mode-hook
;          (lambda ()
;            (add-to-list 'ac-sources 'ac-source-rsense-method)
;            (add-to-list 'ac-sources 'ac-source-rsense-constant)))


(scroll-bar-mode 0)

(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\C-y" 'clipboard-yank)

(setq feature-default-language "fi")
;; ;; point to cucumber languages.yml or gherkin i18n.yml to use
;; ;; exactly the same localization your cucumber uses
(setq feature-default-i18n-file "/home/ifesdjeen/.rvm/gems/ruby-1.9.2-p136@orceo/gems/gherkin-2.2.9/lib/gherkin/i18n.yml")
;; ;; and load feature-mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(setenv "ESHELL" (expand-file-name "~/bin/eshell"))
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))



(require 'textmate)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'coffee-mode)
(require 'rspec-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(rspec-mode)
(textmate-mode)

(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))