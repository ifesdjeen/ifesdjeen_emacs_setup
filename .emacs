;(set-default-font "Monaco-12")

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Extension files path
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme/themes/solarized")
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c")
(add-to-list 'load-path "~/.emacs.d/vendor/rspec-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(add-to-list 'load-path "~/.emacs.d/vendor/cucumber")
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(add-to-list 'load-path "~/.emacs.d/vendor/haml-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/sass-mode")
(add-to-list 'load-path "~/.emacs.d/junk")
(add-to-list 'load-path "~/.emacs.d/vendor/yaml-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/rvm")
(add-to-list 'load-path "~/.emacs.d/vendor/js2-mode")

;(add-to-list 'load-path "~/.emacs.d/muse-el/")
(add-to-list 'load-path "~/.emacs.d/vendor/git-emacs")
(setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:/usr/local/git/bin:/Users/alexp/.rvm/gems/ruby-1.9.2-p136@jumpkick/bin:/Users/alexp/.rvm/gems/ruby-1.9.2-p136@global/bin:/Users/alexp/.rvm/rubies/ruby-1.9.2-p136/bin:/Users/alexp/.rvm/bin:/Users/alexp/opt/mongodb/bin:/opt/ree/bin:/opt/local/bin:/Users/alexp/bin:/opt/local/libexec/git-core:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home" (getenv "PATH")))
(push "/usr/local/bin/git" exec-path)
;;(fmakunbound 'git-status) ; Possibly remove Debian's autoloaded version
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

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; kill current buffer
(defun prh:kill-current-buffer ()
    (interactive)
    (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x w") 'prh:kill-current-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tabbar initialization
;(require 'tabbar)
;(tabbar-mode)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; tabbar end

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color - scheme initialization
(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-initialize)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;; (color-theme-solarized-light)
     (color-theme-solarized-dark)
     ))


;(load-file "~/.emacs.d/vendor/color-theme/themes/color-theme-blackboard.el")
;(load-file "~/.emacs.d/vendor/color-theme/themes/color-theme-twilight.el")


;(if window-system
;    (color-theme-twilight))



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line numbers toggling
;;(add-hook ‘find-file-hook (lambda () (linum-mode 1)))
;;(require 'linum)
;;(global-linum-mode 1)

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
                ("\\.js\\'"                          . js2-mode)
                ("\\.yml\\'"                         . yaml-mode)
                ("\\.txt$"                           . text-mode)
                ) auto-mode-alist ))


;(require 'htmlize)
;(setq htmlize-output-type 'inline-css)
(define-key isearch-mode-map "\C-h" 'isearch-quote-char)

;;(require 'hideshow)  ; builtin to emacs
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

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


(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)

(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))

;; Open Emacs configuration file
(defun emacs-config-file ()
  "Open Emacs Configuration File"
  (interactive)
  (find-file "~/.emacs"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Yasnippet configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'yasnippet) ;;; not yasnippet-bundle
(yas/initialize)
(global-set-key (kbd "C-x C-e") 'yas/expand)
(setq yas/indent-line 'fixed)

;; Yas loading configuration
(add-hook 'clojure-mode-hook (lambda () (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets/clojure-mode/")))
(add-hook 'ruby-mode-hook (lambda () (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets/ruby-mode/")))
(add-hook 'haml-mode-hook (lambda () (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets/haml-mode/")))
(add-hook 'rspec-mode-hook (lambda () (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets/rspec-mode/")))


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

(require 'coffee-mode)
(require 'rspec-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(rspec-mode)
(textmate-mode)

(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

;(require 'aquamacs-tabbar)


(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize)
  ;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  )


(add-to-list 'completion-ignored-extensions ".rbc")

;; Set the tab width
(setq default-tab-width 2)
(setq tab-width 2)
(setq indent-tabs-mode nil)
(setq c-basic-offset 2)
(setq c-basic-indent 2)

(put 'downcase-region 'disabled nil)

(defun clean-blank-lines ()
  "Delete single blank lines, replace multiple blank lines by a single one."
  (interactive)
  (save-excursion
    ;; Search for consecutive blank lines
    (goto-char (point-min))
    (while (search-forward "\n" nil t)
      (replace-match "\n")
      ;; Remove all but one of the remaining newlines after point
      (if (looking-at "\n+")
          (replace-match "\n")))))


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get nil t)

;; Turn off the scroll bar
(scroll-bar-mode 0)
(ns-toggle-fullscreen)
