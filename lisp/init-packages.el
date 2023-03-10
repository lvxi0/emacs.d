 (when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  )

(require 'cl-lib)

;; add whatever packages you want here
(defvar lvxi/packages '(
                       company
                       monokai-theme
                       hungry-delete
                       swiper
                       counsel
                       smartparens
		       js2-mode
		       nodejs-repl
		       popwin
		       reveal-in-osx-finder
		       web-mode
		       expand-region
		       iedit
		       org-pomodoro
                       ) "Default packages")

(setq package-selected-packages lvxi/packages)

(defun lvxi/packages-installed-p ()
  (cl-loop for pkg in lvxi/packages
       when (not (package-installed-p pkg)) do (cl-return nil)
       finally (cl-return t)))

(unless (lvxi/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg lvxi/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))



(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(global-hungry-delete-mode)

(load-theme 'monokai t)
(require 'hungry-delete)
(global-hungry-delete-mode)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))


(global-company-mode t)

(require 'popwin)
(popwin-mode t)

(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'init-packages)
