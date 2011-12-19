(load "mode-compile")

(autoload 'mode-compile "mode-compile" "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

(load "rvm")

(require 'rvm)
(rvm-use-default) 

(load "rspec-mode")

;; load bundle snippets
(yas/load-directory (concat bundles-dir "rspec/snippets"))

(require 'rspec-mode)
(rspec-mode)
