(use-package org
  :pin melpa
  :ensure t)

(use-package org-contrib
  :pin nongnu)

(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
	(sequence "WAIT(w@/!)" "SOMEDAY(S)" | "CANCEL(c@/!" "PHONE(p)")))

(use-package org-download
  :demand t
  :after org
  :config
  (add-hook 'dired-mode-hook 'org-download-enable)
  ;(setq org-download-screenshot-method)
  (defun org-download-annotate-default (link)
    "Annotate LINK with the time of download."
    (make-string 0 ?\s))
  (setq-default org-download-heading-lvl nil
		org-download-image-dir "./img"
		org-download-screenshot-file (expand-file-name "shot.jpg" temporary-file-directory)))

(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/org/roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n g" . org-roam-graph)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n c" . org-roam-capture)
	 ;; Dailies
	 ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:20}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))



(provide 'init-org)
