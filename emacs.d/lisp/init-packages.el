(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
	use-package-expand-minimally t))

;; auto-install packages
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; auto-update packages
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package emacs
  :custom
  (completion--cycle-threshold 3)
  (tab-always-indent 'complete))

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-separator ?\s)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match nil)
  (corfu-preview-current nil)
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)
  :init
  (global-corfu-mode)
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion))))
)

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  )

(use-package marginalia
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings)))
(setq prefix-help-command #'embark-prefix-help-command)

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package consult)
(global-set-key (kbd "C-s") 'consult-line)

(eval-after-load 'consult
  (progn
    (setq consult-narrow-key "<"
	  consult-line-numbers-widen t
	  consult-async-min-input 2
	  consult-async-refresh-delay 0.15
	  consult-async-input-throttle 0.2
	  consult-async-input-debounce 0.1)))

(use-package wgrep)
(setq wgrep-auto-save-buffer t)

(use-package magit)

(use-package evil
  :custom
  (evil-want-keybinding nil)
  (evil-want-C-u-scroll t)
  :init
  (evil-mode)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "RET") nil))
  )

(use-package undo-tree
  :diminish
  :init
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil)
  (evil-set-undo-system 'undo-tree))

(use-package evil-anzu
  :after evil
  :diminish
  :demand t
  :init
  (global-anzu-mode t))

(use-package evil-collection
  :demand t
  :config
  (setq evil-collection-mode-list (remove 'lispy evil-collection-mode-list))
  (evil-collection-init)

  (cl-loop for (mode . state) in
	   '((org-agenda-mode . normal)
	     (Custom-mode . emacs)
	     (eshell-mode . emacs)
	     (makey-key-mode . motion))
	   do (evil-set-initial-state mode state)))

(use-package evil-surround
  :init
  (global-evil-surround-mode 1))

(use-package evil-nerd-commenter
  :init
  (define-key evil-normal-state-map
	      (kbd ",/") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map
	      (kbd ",/") 'evilnc-comment-or-uncomment-lines)
  )

(use-package evil-snipe
  :diminish
  :init
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

;(use-package evil-matchit
  ;:ensure nil
  ;:init
  ;(global-evil-matchit-mode 1)
;  )

(provide 'init-packages)

