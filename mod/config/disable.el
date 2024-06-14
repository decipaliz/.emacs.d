;; -*- lexical-binding: t -*-

(before!
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

 (setq warning-minimum-level :emergency))
