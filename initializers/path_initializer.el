(setq exec-path (split-string (getenv "PATH") ":"))
(setenv "PATH" (concat "/opt/local/bin:/opt/local/sbin:/Users/ifesdjeen/bin" (getenv "PATH")))
