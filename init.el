(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  )

(require 'cl)

;; add whatever packages you want here
(defvar lvxi/packages '(
			company
			monokai-theme
			hungry-delete
			swiper
			counsel
			smartparens
			) "Default packages")

(setq package-selected-packages lvxi/packages)

(defun lvxi/packages-installed-p ()
  (loop for pkg in lvxi/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (lvxi/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg lvxi/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)


(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file) 

(global-linum-mode t)
(global-company-mode t)
(setq-default cursor-type 'bar)
(setq make-backup-files nil)

(require 'org)
(require 'org-tempo)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode t)

(load-theme 'monokai t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   '("95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" default))
 '(package-selected-packages '(counsel swiper smex company monokai-theme hungry-delete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


