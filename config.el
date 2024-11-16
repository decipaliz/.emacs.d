(menu-bar-mode 0)
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

(setq inhibit-startup-screen t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)
(setq-default truncate-lines nil)

(setq make-backup-files nil)
(setq load-prefer-newer t)

(setq warning-minimum-level :emergency)

(electric-pair-mode)
(electric-indent-mode)
(electric-quote-mode)

(add-to-list 'default-frame-alist '(alpha . 95))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(undecorated . t))

(set-face-attribute 'default nil :font "Hack Nerd Font" :height 120)
(set-face-attribute 'fixed-pitch nil :font "Hack Nerd Font" :height 120)
(set-face-attribute 'variable-pitch nil :font "Liberation Sans" :height 120)

(add-hook 'prog-mode-hook #'hl-line-mode)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t t)
