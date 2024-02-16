;; (server-mode 1)
(electric-pair-mode t)
(show-paren-mode t)
(delete-selection-mode t)

(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
;(use-package recentf
;  :custom
;  (recentf-max-menu-item 20)
;  :init
;  (recentf-mode 1))

(global-auto-revert-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-defaults)
