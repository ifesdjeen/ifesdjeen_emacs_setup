;;
;; bundles
;;

(defun elbundle/path-of (bundle-name)
  (concat emacsd-dir "bundles/" bundle-name "/"))

(defmacro elbundle/load-elbundle (bundle-name)
  (let* ((bundle-dir (elbundle/path-of bundle-name))
        (bundle-init-file (concat bundle-dir "init"))
        (bundle-keymap-file (concat bundle-dir "keymap"))
        (bundle-grammar-file (concat bundle-dir "grammar")))
    ;; let* body
    ;; (message "Adding %s to load-path..." bundle-dir)
     (add-to-list 'load-path bundle-dir)
     (load bundle-init-file)
     ;; don't break if keymap or grammar are not found
     (load bundle-keymap-file t)
     (load bundle-grammar-file t)))

(add-to-list 'load-path "bundles")

(if window-system
    (elbundle/load-elbundle "color-theme"))

(elbundle/load-elbundle "smooth-scrolling")

(elbundle/load-elbundle "textile")
(elbundle/load-elbundle "markdown")
(elbundle/load-elbundle "linkify")

(elbundle/load-elbundle "ruby")

(elbundle/load-elbundle "clojure")
(elbundle/load-elbundle "yaml")
(elbundle/load-elbundle "haml")

(elbundle/load-elbundle "rspec")
(elbundle/load-elbundle "cucumber")
(elbundle/load-elbundle "rake")

(elbundle/load-elbundle "scala")
(elbundle/load-elbundle "javascript")

(elbundle/load-elbundle "webtools")
(elbundle/load-elbundle "ack")
(elbundle/load-elbundle "textmate")
(elbundle/load-elbundle "tabbar")

(elbundle/load-elbundle "c")
(elbundle/load-elbundle "cpp")
(elbundle/load-elbundle "erlang")
(elbundle/load-elbundle "python")
(elbundle/load-elbundle "shell-script")

(elbundle/load-elbundle "auto-complete")
(elbundle/load-elbundle "git")
