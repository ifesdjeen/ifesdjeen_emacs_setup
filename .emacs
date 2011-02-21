(set-default-font "Consolas-10")
;;in the .emacs
;;(require 'ido)
;;(ido-mode 1)
;;(setq ido-enable-flex-matching 1) ;; enable fuzzy matching

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Extension files path
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme/")
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c")
(add-to-list 'load-path "~/.emacs.d/rspec-mode")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/git-emacs") 
(add-to-list 'load-path "~/.emacs.d/feature-mode")

;(add-to-list 'load-path "~/.emacs.d/muse-el/")
(setenv "PATH" (concat "/opt/l ocal/bin:/usr/local/bin:/usr/local/git/bin" (getenv "PATH")))
(push "/usr/local/git/bin" exec-path)


(fmakunbound 'git-status) ; Possibly remove Debian's autoloaded version
(require 'git-emacs-autoloads)

;(add-to-list 'load-path "~/.emacs.d/rinari")
;(require 'rinari)

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

(global-set-key [S-M-left] 'tabbar-backward-tab)
(global-set-key [S-M-right] 'tabbar-forward-tab)

(set-face-foreground 'tabbar-default "LightSteelBlue")
(set-face-background 'tabbar-default "DarkSlateGray")
(set-face-foreground 'tabbar-selected "pale green")

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
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

(tabbar-mode)
;; tabbar end

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color - scheme initialization
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/vendor/color-theme/themes/color-theme-blackboard.el")


;;
(global-set-key [?\C-z] 'shell) ;; shell
(global-set-key [?\C-x ?\C-g] 'goto-line) ;; goto line
(global-set-key [?\C-x ?\C-b] 'ibuffer) ;; great buffer switcher

(if window-system
    (color-theme-blackboard))


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line numbers toggling
;;(add-hook ‘find-file-hook (lambda () (linum-mode 1)))
(require 'linum)
(global-linum-mode 1)

;;(ffap-bindings)
;;(require 'ffap-)
;;(add-hook 'dired-mode-hook 'ffap-inhibit-here)
;;(require 'find-recursive)

(global-set-key "\C-c\C-w"  'compare-windows)
(global-set-key "\M-g"      'goto-line)
(global-set-key "\M-\C-^"   'describe-variable)
(global-set-key "\C-^"      'describe-key-briefly)
(global-set-key "\C-cw" 'where-is)
(global-set-key "\C-c!"     'revert-buffer-unconditionally)
;(global-set-key "\C-/"      'undo)

;;(setq mark-even-if-inactive t)
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
(set-face-background 'hl-line "#330")  ;; Emacs 22 Only

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))


(global-set-key  [(meta return)] 'toggle-fullscreen)
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
;; (setq feature-default-i18n-file "/home/ifesdjeen/.rvm/gems/jruby-head/gems/gherkin-2.2.9-java/lib/gherkin/i18n.yml")
;; ;; and load feature-mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(setenv "ESHELL" (expand-file-name "~/bin/eshell"))
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))


(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)
