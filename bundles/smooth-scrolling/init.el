;; (require 'smooth-scrolling)

;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;; (setq mouse-wheel-progressive-speed nil)

;; (global-set-key [(down)]  'smooth-scroll-down)
;; (global-set-key [(up)]    'smooth-scroll-up)
;;(global-set-key [(left)]  'scroll-right-1)
;;(global-set-key [(right)] 'scroll-left-1)


(require 'smooth-scroll)
(smooth-scroll-mode t)

(global-set-key [(down)]  'scroll-up-1)
(global-set-key [(up)]    'scroll-down-1)
(global-set-key [(left)]  'scroll-right-1)
(global-set-key [(right)] 'scroll-left-1)