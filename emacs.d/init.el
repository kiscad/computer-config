(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			  ("gnu" . "https://elpa.gnu.org/packages/")
			  ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)


;; Package
(use-package emacs
  :custom
  (completion--cycle-threshold 3)
  (tab-always-indent 'complete))

(use-package corfu
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
  (global-corfu-mode))


;; basic
(global-auto-revert-mode 1)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)


;; UI
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(setq-default cursor-type 'bar)


;; key binding
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-x") 'kill-region)

