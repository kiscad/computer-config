(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(setq-default cursor-type 'bar)

(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (setq column-number-mode t))

(use-package doom-modeline
  :init
  (doom-modeline-mode t))
;(mode-line ((t (:height 0.9))))
;(mode-line-inactive ((t (:height 0.9))))

(use-package monokai-theme
  :init
  (load-theme 'monokai 1))

(provide 'init-ui)
