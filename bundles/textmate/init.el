(load "textmate")

(load "ido-hacks")

(require 'ido-hacks)
(ido-hacks-mode)

(require 'textmate)
(textmate-mode)

(global-set-key "\M-t" 'textmate-goto-file)
(global-set-key (kbd "C-x t") 'textmate-goto-symbol)
