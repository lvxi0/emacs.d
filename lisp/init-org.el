(require 'org)
(require 'org-tempo)
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/Work/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
