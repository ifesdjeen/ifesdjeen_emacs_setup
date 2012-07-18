;; (setq custom-file (concat emacsd-dir "custom.el"))
;; (load custom-file)

(add-to-list 'load-path emacsd-dir)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;
;; Initializers
;;

(defun load-initializer (name)
  "Loads initializer with name NAME"
  (load (concat "initializers/" name "_initializer"))
  (message (concat "Loaded " name)))

;; These MUST be loaded first if you want to use
;; byte-code-cache.
;;
;; However, idea of precompilation seem to
;; work better.
;;
(defvar byte-compile-warnings t)
(defvar byte-compile-verbose t)

(load-initializer "yasnippet")
(load-initializer "bundles")
(load-initializer "keyboard")
(load-initializer "ui")

(add-to-list 'safe-local-eval-forms '(clojure-swank-command . "lein2 jack-in %s"))

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))
