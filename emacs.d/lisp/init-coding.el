(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)

(use-package treesit-auto
  :demand t
  :config
  (setq treesit-auto-install 'prompt)
  (setq treesit-font-lock-level 4)
  (global-treesit-auto-mode))


(use-package yasnippet
  :hook
  ((prog-mode . yas-minor-mode)
   (org-mode . yas-minor-mode))
  :init
  :config
  (setq hippie-expand-try-functions-list
	'(yas/hippie-try-expand
	  try-complete-file-name-partially
	  try-expand-all-abbrevs
	  try-expand-dabbrev
	  try-expand-dabbrev-all-buffers
	  try-expand-dabbrev-from-kill
	  try-complete-lisp-symbol-partially
	  try-complete-lisp-symbol)))

(use-package yasnippet-snippets
  :after yasnippet)

(provide 'init-coding)


