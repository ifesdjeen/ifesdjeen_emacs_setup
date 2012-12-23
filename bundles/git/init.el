(push "/usr/local/bin/git" exec-path)
(require 'git-emacs-autoloads)

(require 'git-blame)
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)

; (global-set-key "\M-w" 'git-pull-ff-only)
;
