(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "lvxi.org" user-emacs-directory))
