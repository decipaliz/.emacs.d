;; this file gets replaced with generated configuration from init.org

(require 'org)
(find-file (expand-file-name "init.org" user-emacs-directory))
(org-babel-tangle)
(load-file (expand-file-name "init.el" user-emacs-directory))
(byte-compile-file (expand-file-name "init.el" user-emacs-directory))
