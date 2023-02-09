(require 'org)
(require 'org-tempo)
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/Work/org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Work/org/work.org" "Work Plan")
	 "* TODO [#B] %?\n %i\n"
	 :empty-lines 1)))

(global-set-key (kbd "C-c r") 'org-capture)


(provide 'init-org)
